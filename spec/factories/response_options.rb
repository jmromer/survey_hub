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
    value { %w[Yes No].sample }
    question
  end
end
