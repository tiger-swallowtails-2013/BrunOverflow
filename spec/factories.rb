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
        FactoryGirl.create_list(:answer, rand(1..10), question: question)
      end
    end
  end

  factory :user do |f|
    f.name { Faker::Internet.user_name }
    f.password { Faker::Internet.password }
  end

  factory :vote do |f|
    f.value 1
    f.user FactoryGirl.build(:user)
    f.votable FactoryGirl.build(:question)
  end

end
