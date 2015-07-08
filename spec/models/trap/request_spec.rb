require 'rails_helper'

RSpec.describe Trap::Request, type: :model do
  context 'json serialize' do
    it 'query_params' do
      req = create(:trap_request, query_params: {hello: 'world'})
      req.reload
      expect(req.query_params['hello']).to eq 'world'
    end

    it 'cookies' do
      req = create(:trap_request, cookies: {hello: 'world'})
      req.reload
      expect(req.cookies['hello']).to eq 'world'
    end

    it 'headers' do
      req = create(:trap_request, headers: {hello: 'world'})
      req.reload
      expect(req.headers['hello']).to eq 'world'
    end

    it 'response' do
      req = create(:trap_request, response: {hello: 'world'})
      req.reload
      expect(req.response['hello']).to eq 'world'
    end
  end
end
