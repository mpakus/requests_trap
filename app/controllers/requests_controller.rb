class RequestsController < ApplicationController
  before_action :find_a_trap,     only: [:create]
  after_action  :update_response, only: [:index]
  skip_before_filter :verify_authenticity_token, only: [:create]

  # [*] /:trap_id
  def create
    @req = TrapRequestCreate.new(request).create!
    respond_to do |format|
      format.html { render text: "request logged, id: #{@req.id}" }
      format.json { render json: { id: @req.id }, status: 500 }
    end
  rescue => e
    render_error(e.message)
  end

  # GET /:trap_uri/requests
  def index

  end

  # GET /:trap_uri/requests/:id
  def show

  end

  private

  def update_response
    @req.update!(response: response.body) if @req
  end

  def find_a_trap
    @trap = Trap.find_by_uri(params[:trap_uri])
    raise ActiveRecord::RecordNotFound if @trap.nil?
  end
end