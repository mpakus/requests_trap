FactoryGirl.define do
  factory :trap_request, :class => 'Trap::Request' do
    trap nil
remote_ip "MyString"
request_method "MyString"
scheme "MyString"
query_string "MyText"
query_params "MyText"
cookies "MyText"
raw "MyText"
  end

end
