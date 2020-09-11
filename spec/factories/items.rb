FactoryBot.define do
  factory :item do
    title                         {Faker::Lorem.sentence}
    content                       {Faker::Lorem.sentence}
    status_id                        {2}
    burden_id                        {2}
    area_id                          {2}
    days_id                          {2}
    price                         {3000}
    category_id                   {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
