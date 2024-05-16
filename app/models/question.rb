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
  has_many :responses, through: :response_options

  validates :text, presence: true
end
