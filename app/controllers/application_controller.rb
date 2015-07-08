class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  [403, 404, 500].each do |num|
    define_method :"show_#{num}" do
      render file: "#{Rails.root}/public/#{num}.html", layout: false, status: num
    end
  end

  protected

  def render_error(message, code=500)
    respond_to do |format|
      format.html { send("show_#{code}") }
      format.json { render json: { error: message }, status: code }
    end
    false
  end

  def render_404
    render('404 page not found', 404)
  end
end
