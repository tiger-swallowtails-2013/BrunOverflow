require 'faker'

FactoryGirl.define do
  factory :answer do
    body { Faker::Lorem.paragraph }
  end

  factory :question do |f|
    f.title { Faker::Lorem.sentence(rand(3..5)) }
    f.content { Faker::Lorem.paragraph(rand(1..3)) }
  end

end