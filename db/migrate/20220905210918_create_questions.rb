# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.belongs_to :survey, null: false, foreign_key: true

      t.string :text, null: false
      t.string :description

      t.timestamps null: false
    end
  end
end
