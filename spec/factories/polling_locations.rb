# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :polling_location do
    sequence(:api_id)
    name { "Polling Location ##{api_id}" }
    address '123 Main St.'
    zip 90210
    opens_at '07:00:00'
    closes_at '19:00:00'

    trait :early_voting do
      early_voting_starts '2014-05-31'
      early_voting_opens_at '07:00:00'
      early_voting_closes_at '19:00:00'
    end
  end
end
