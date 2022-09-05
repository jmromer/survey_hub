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
require "rails_helper"

RSpec.describe ResponseOption, type: :model do
  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_numericality_of(:responses_count) }

  it { is_expected.to belong_to(:question) }
  it { is_expected.to have_many(:responses) }
  it { is_expected.to have_many(:respondents).through(:responses) }
end
