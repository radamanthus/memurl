FactoryBot.define do
  factory :url do
    trait :empty_url do
      url ''
    end
    trait :non_empty_url do
      url 'goo.gl'
    end
  end
end
