class RequestsController < ApplicationController
  before_action :find_a_trap
  after_action :update_response, only: [:index]
  skip_before_action :verify_authenticity_token, only: [:create]

  # [*] /:trap_id
  def create
    @req = TrapRequestCreate.new(request, @trap).create!
    respond_to do |format|
      format.html { render text: "request logged, id: #{@req.id}" }
      format.json { render json: { id: @req.id }, status: 500 }
    end
  rescue => e
    render_error(e.message)
  end

  # GET /:trap_uri/requests
  def index; end

  # GET /:trap_uri/requests/:id
  def show
    @request = @trap.requests.find(params[:id])
  end

  # GET /:trap_uri/requests/:id/stream
  def stream
    response.headers['Content-Type'] = 'text/event-stream'

    last_request = @trap.requests.last_created.first
    io_write(last_request) if recently_changed? last_request
  ensure
    response.stream.close
  end

  private

  def io_write(last_request)
    response.stream.write("event: results\n")
    tpl = render_to_string(partial: '/trap/requests/request.html.erb', locals: { request: last_request }).delete("\n")
    response.stream.write("data: #{tpl}\n\n")
  end

  def update_response
    @req.update!(response: response.body) if @req
  end

  def find_a_trap
    @trap = Trap.find_by_uri(params[:trap_uri])
    fail ActiveRecord::RecordNotFound if @trap.nil?
  end

  def recently_changed?(request)
    request.created_at > 2.seconds.ago
  end
end
