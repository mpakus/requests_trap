class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  private

  def render_404
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404.html", layout: false, status: 404 }
      format.json { render json: { error: '404 page not found' }, status: 404 }
    end
    false
  end
end
