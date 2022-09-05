# frozen_string_literal: true

# == Schema Information
#
# Table name: response_options
#
#  id              :integer          not null, primary key
#  description     :string
#  responses_count :integer          default(0), not null
#  value           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  question_id     :integer
#
# Indexes
#
#  index_response_options_on_question_id  (question_id)
#
# Foreign Keys
#
#  question_id  (question_id => questions.id)
#
FactoryBot.define do
  factory :response_option do
    value { Faker::Lorem.word }
    question

    trait :yes do
      value { "Yes" }
    end

    trait :no do
      value { "No" }
    end
  end
end
