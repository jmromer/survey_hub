# frozen_string_literal: true

Survey.destroy_all
User.destroy_all

$stdout.puts "--- Creating Survey Creator ----"
user = User.create

$stdout.puts "--- Creating Surveys ----"
surveys = FactoryBot.create_list(:survey, 30, creator: user)

$stdout.puts "--- Creating Responses ----"
users = FactoryBot.create_list(:user, 10)
surveys.each do |survey|
  users.sample(4).each do |respondent|
    survey.question.responses.create(
      response_option: survey.question.response_options.sample,
      respondent:,
    )
  end
end
