FactoryGirl.define do
  factory :trap_request, :class => 'Trap::Request' do
    trap
    remote_ip { Faker::Internet.ip_v4_address }
    request_method 'POST'
    scheme  'http'
    query_string 'localhost:3000?param=value'
    query_params { Hash.new('param' => 'value') }
    cookies { Hash.new('hello' => 'world') }
    headers {}
  end

end
