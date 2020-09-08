FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.initials(number: 2)}
    first_name              {"トム"}
    family_name             {"ヘンリ"}
    first_name_kana         {"トム"}
    family_name_kana        {"ヘンリ"}
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    birthday                {"1990-12-01"}
  end
end