class RequestMock
  def remote_ip
    '127.0.0.1'
  end

  def request_method
    'POST'
  end

  def env
    {
        'REQUEST_URI' => 'http://localhost:3000/shop?hello=word',
        'rack.request.cookie_hash' => [ 'cookie1' => 'val1', 'cookie2' => 'val2' ]
    }
  end

  def params
    {'hello' => 'world'}
  end

  def body
    { 'content-type' => 'text/html' }
  end
end
