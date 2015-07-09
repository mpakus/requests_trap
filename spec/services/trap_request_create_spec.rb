require 'rails_helper'
require 'request_mock'

describe TrapRequestCreate do
  before(:all) do
    @trap    = create(:trap)
    @request = RequestMock.new
  end

  it 'Trap::Request with right fields' do
    request = TrapRequestCreate.new(@request, @trap).create!
    expect(request.remote_ip).to eq @request.remote_ip
    expect(request.headers).to   eq @request.body
    expect(request.query_string).to eq @request.env['REQUEST_URI']
    expect(request.query_params).to eq @request.params
    expect(request.cookies).to      eq @request.env['rack.request.cookie_hash']
  end

  it 'is right related to the Trap model' do
    request = TrapRequestCreate.new(@request, @trap).create!
    expect(request.trap).to eq @trap
  end
end
