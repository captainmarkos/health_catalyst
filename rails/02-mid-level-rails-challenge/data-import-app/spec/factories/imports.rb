FactoryBot.define do
  factory :import do
    customer
    start_time { (Time.now - 1.day) }
    end_time { Time.now }
    duration { '86400' }
    status { 'succeeded' }
    identifier { '0001' }
  end
end
