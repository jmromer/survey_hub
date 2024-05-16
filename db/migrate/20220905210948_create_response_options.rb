# frozen_string_literal: true

class CreateResponseOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :response_options do |t|
      t.belongs_to :question, foreign_key: true

      t.string :value, null: false
      t.string :description
      t.integer :responses_count, null: false, default: 0

      t.index %i[value question_id], unique: true

      t.timestamps null: false
    end
  end
end
