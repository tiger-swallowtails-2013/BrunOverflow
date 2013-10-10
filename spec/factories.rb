require 'faker'

FactoryGirl.define do
  factory :answer do
    body { Faker::Lorem.paragraph }
    question
  end

  factory :question do |f|
    f.title { Faker::Lorem.sentence(rand(3..5)) }
    f.content { Faker::Lorem.paragraph(rand(1..3)) }

    factory :question_with_answers do |f|
      after(:create) do |question|
        FactoryGirl.create_list(:answer, 5, question: question)
      end
    end
  end

end