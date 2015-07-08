class RequestsController < ApplicationController
  before_action :find_a_trap, only: [:create]

  # [*] /:trap_id
  def create
    logger.log request
  end

  # GET /:trap_uri/requests
  def index

  end

  # GET /:trap_uri/requests/:id
  def show

  end

  private
  def find_a_trap
    @trap = Trap.find_by_uri(params[:trap_uri])
    raise ActiveRecord::RecordNotFound if @trap.nil?
  end
end