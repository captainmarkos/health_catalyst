FactoryBot.define do
  factory :customer do
    partner
    name { 'John' }
    subdomain { 'sub.primary.com' }
    location { 'Miami' }
  end
end
