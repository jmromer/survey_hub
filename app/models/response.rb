# frozen_string_literal: true

# == Schema Information
#
# Table name: responses
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  respondent_id      :integer          not null
#  response_option_id :integer          not null
#
# Indexes
#
#  index_responses_on_respondent_id                         (respondent_id)
#  index_responses_on_response_option_id                    (response_option_id)
#  index_responses_on_response_option_id_and_respondent_id  (response_option_id,respondent_id) UNIQUE
#
# Foreign Keys
#
#  respondent_id       (respondent_id => users.id)
#  response_option_id  (response_option_id => response_options.id)
#
class Response < ApplicationRecord
  belongs_to :response_option, counter_cache: true
  belongs_to :question, counter_cache: true
  belongs_to :respondent, class_name: "User"

  validates :respondent_id, uniqueness: { scope: :response_option_id }
  validates :respondent_id, uniqueness: { scope: :question_id }
end
