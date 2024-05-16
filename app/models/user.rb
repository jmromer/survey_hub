# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :surveys,
           foreign_key: :creator_id,
           inverse_of: :creator,
           dependent: :nullify
end
