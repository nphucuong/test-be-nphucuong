# frozen_string_literal: true

class CreateToken < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.references :user, foreign_key: true, type: :integer
      t.string :token
      t.datetime :expires_at
      t.timestamps
    end
  end
end
