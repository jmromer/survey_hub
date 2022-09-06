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
class ResponseOption < ApplicationRecord
  belongs_to :question
  has_many :responses, dependent: :destroy
  has_many :respondents, through: :responses

  validates :value, :responses_count, presence: true
  validates :responses_count, numericality: { greater_than_or_equal_to: 0 }

  validates :value, uniqueness: { scope: :question_id, case_sensitive: false }
end
