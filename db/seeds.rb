# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "faker"

def create_user
  User.create(email: Faker::Internet.email, password: Faker::Internet.password)
end

def create_question
  Question.create(title: "#{Faker::Company.catch_phrase}?", content: Faker::Lorem.paragraphs(paragraph_count = (rand(2..5)), supplemental = false).join('. '))
end

# create users with questions
rand(10..20).times do
  user = create_user
  rand(5..7).times do
    question = create_question
    user.questions << question
    p "Created question: #{question.title}, for user: #{user.email}"
  end
end

# create answers from subset of these users
users = User.all
5.times {users.pop}
users.each do |user|
  questions_without_answers = Question.where('answers_count = 0')
  question = (questions_without_answers.size == 0 ? Question.all.sample : questions_without_answers.sample)
  answer = question.answers.create(body: Faker::Lorem.paragraphs(paragraph_count = (rand(2..3)), supplemental = false).join('. '))
  user.answers << answer
  p "Created answer: #{answer.body}, for user: #{user.email} on question: #{question.title}"
  question.reload
end

# create new set of users with answers
rand(10..20).times do
  user = User.create(email: Faker::Internet.email, password: Faker::Internet.password)
  rand(15..25).times do
    questions_without_answers = Question.where('answers_count = 0')
    question = (questions_without_answers.size == 0 ? Question.all.sample : questions_without_answers.sample)
    answer = question.answers.create(body: Faker::Lorem.paragraphs(paragraph_count = (rand(2..3)), supplemental = false).join('. '))
    user.answers << answer
    p "Created answer: #{answer.body}, for user: #{user.email} on question: #{question.title}"
    question.reload
  end
end

# create votes on questions and answers
#
# users = User.all
# 5.times {users.pop}
# users.each do |user|
#   rand(15..30).times do

#     questions_without_votes = Question.where('votes_count = 0')
#     question = (questions_without_votes.size == 0 ? Question.all.sample : questions_without_votes.sample)
#     vote = Vote.create(:value => 1, :user_id => user.id)

#     question.votes.create(:value => 1, :user_id => user.id)
#     #user.votes << vote

#     question.reload

#     vote = Vote.create(:value => 1)
#     answers_without_votes = Answer.where('votes_count = 0')
#     answer = (answers_without_votes.size == 0 ? Answer.all.sample : answers_without_votes.sample)
#     answer.votes << vote
#     user.votes << vote

#     answer.reload
#   end

# end

p "Users: #{User.count}"
p "Questions: #{Question.count}"
p "Answers: #{Answer.count}"
# p "Votes: #{Vote.count}"


