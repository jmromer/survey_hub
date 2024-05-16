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
require "rails_helper"

RSpec.describe Question, type: :model do
  it { is_expected.to belong_to(:survey) }
  it { is_expected.to have_many(:response_options) }
  it { is_expected.to have_many(:responses) }

  it { is_expected.to validate_presence_of(:text) }
end
