require 'rails_helper'

describe 'RequestsController', type: :request do
  before(:all) do
    @trap   = create(:trap)
    @params = {callback: 'paypal.com', token: 'fresh-ice-tea1000'}
  end

  context '/:trap_uri' do
    it 'is return 404 on wrong trap uri' do
      post "/trap-not-found", @params
      expect(response.status).to eq 404
    end

    it 'is create on POST' do
      post "/#{@trap.uri}", @params
      expect(response.status).to eq 200
    end

    it 'is create on GET' do
      get "/#{@trap.uri}", @params
      expect(response.status).to eq 200
    end

    it 'is create on PUT' do
      put "/#{@trap.uri}", @params
      expect(response.status).to eq 200
    end

    it 'is create on PATCH' do
      patch "/#{@trap.uri}", @params
      expect(response.status).to eq 200
    end

    it 'is create on DELETE' do
      delete "/#{@trap.uri}", @params
      expect(response.status).to eq 200
    end

    it 'is answer with html by default' do
      post "/#{@trap.uri}", @params
      expect(response.content_type).to eq :html
    end

    it 'is answer with json' do
      post "/#{@trap.uri}.json", @params
      expect(response.content_type).to eq :json
    end

    it 'has id in html answer' do
      post "/#{@trap.uri}", @params
      expect(response.body =~ /id:/).to be_truthy
    end

    it 'has id in json answer' do
      post "/#{@trap.uri}.json", @params
      expect(json['id']).to_not be_nil
    end
  end

  context '/:trap_uri/requests' do
    it 'has right status' do
      get "/#{@trap.uri}", @params
      expect(response.status).to eq 200
    end

    it 'shows 404 when trap wrong' do
      get "/trap-not-found", @params
      expect(response.status).to eq 404
    end
  end

  context '/:trap_uri/requests/:id' do
    it 'has right status' do
      post "/#{@trap.uri}.json", @params
      get "/#{@trap.uri}/requests/#{json['id']}"
      expect(response.status).to eq 200
    end

    it 'shows 404 if request not exist' do
      post "/#{@trap.uri}.json", @params
      get "/#{@trap.uri}/requests/wrong-id"
      expect(response.status).to eq 404
    end
  end
end
