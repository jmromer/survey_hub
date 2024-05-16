# frozen_string_literal: true

# == Schema Information
#
# Table name: surveys
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  creator_id :integer          not null
#
# Indexes
#
#  index_surveys_on_creator_id  (creator_id)
#
# Foreign Keys
#
#  creator_id  (creator_id => users.id)
#
FactoryBot.define do
  factory :survey do
    creator factory: :user

    after(:build) do |survey, _evaluator|
      create(:question, survey:)
    end
  end
end
