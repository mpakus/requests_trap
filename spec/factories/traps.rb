FactoryGirl.define do
  factory :trap do
    uri { Faker::Internet.domain_word }
  end
end
