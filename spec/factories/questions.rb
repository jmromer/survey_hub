# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  description :string
#  text        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  survey_id   :integer          not null
#
# Indexes
#
#  index_questions_on_survey_id  (survey_id)
#
# Foreign Keys
#
#  survey_id  (survey_id => surveys.id)
#
FactoryBot.define do
  factory :question do
    survey
    text { Faker::Lorem.question }
    description { Faker::Lorem.paragraph(sentence_count: 2) }

    after(:build) do |question, _evaluator|
      create(:response_option, :yes, question:)
      create(:response_option, :no, question:)
    end
  end
end
