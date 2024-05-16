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
require "rails_helper"

RSpec.describe Survey, type: :model do
  it { is_expected.to belong_to(:creator).class_name(User.to_s) }
  it { is_expected.to have_one(:question) }
end
