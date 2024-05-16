# frozen_string_literal: true

class CreateSurveys < ActiveRecord::Migration[7.0]
  def change
    create_table :surveys do |t|
      t.belongs_to :creator, null: false, foreign_key: { to_table: :users }

      t.timestamps null: false
    end
  end
end
