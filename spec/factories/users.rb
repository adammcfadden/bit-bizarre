FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@bizarre.com"}
    sequence(:password, 10000000) { |n| "#{n}"}
    admin false

    trait :admin do
      admin true
      sequence(:email) { |n| "admin#{n}@bizarre.com"}
    end

    factory :admin, traits: [:admin]
  end

end
