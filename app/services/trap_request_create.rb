require 'trap/request'

class TrapRequestCreate
  def initialize(request, trap)
    @params = {
      remote_ip:      request.remote_ip,
      request_method: request.request_method,
      scheme:         request.scheme,
      query_string:   request.env['REQUEST_URI'],

      query_params:   request.params,
      cookies:        request.env['rack.request.cookie_hash'],
      headers:        request.body,

      trap_id:        trap.id
    }
    ap @params
  end

  def create!
    Trap::Request.create!(@params)
  end
end
