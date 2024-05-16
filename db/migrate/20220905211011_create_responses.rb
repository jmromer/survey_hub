# frozen_string_literal: true

class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.belongs_to :response_option, null: false, foreign_key: true
      t.belongs_to :respondent, null: false, foreign_key: { to_table: :users }

      t.index %i[response_option_id respondent_id], unique: true

      t.timestamps null: false
    end
  end
end
