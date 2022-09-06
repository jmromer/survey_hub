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
class Question < ApplicationRecord
  belongs_to :survey
  has_many :response_options, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :respondents, through: :responses

  validates :text, presence: true

  after_create :create_default_response_options

  # Record the survey response provided by the respondent.
  # If the respondent has already responded to this question, update their
  # response. Otherwise persist a new record for the respondent's response.
  def record_response(respondent:, response_option:)
    existing_response = responses.find_by(respondent:)
    return existing_response.update(response_option:) if existing_response.present?

    responses.new(respondent:, response_option:).save
  end

  private

  def create_default_response_options
    return if response_options.present?

    response_options.find_or_create_by(value: "Yes")
    response_options.find_or_create_by(value: "No")
  end
end
