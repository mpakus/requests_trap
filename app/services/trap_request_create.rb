class TrapRequestCreate
  def initialize(request)
    # request date
    # remote ip 
    # request-method
    # scheme 
    # query-string 
    # query-params 
    # cookies 
    # headers
    uri     = URI.parse(request.env['REQUEST_URI'])
    @params = {
        remote_ip:      request.remote_ip,
        request_method: request.request_method,
        scheme:         uri.scheme,
        query_string:   request.env['REQUEST_URI'],

        query_params:   request.params,
        cookies:        request.env['rack.request.cookie_hash'],
        headers:        request.body
    }
  end

  def create!
    Trap::Request.create!(@params)
  end
end