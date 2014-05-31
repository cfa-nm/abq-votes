# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :voter do
    sequence(:name) { |u| "Voter ##{u}" }
    email { "#{name.parameterize}@example.com" }
    birthday { 40.years.ago }
  end
end
