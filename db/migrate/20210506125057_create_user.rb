# frozen_string_literal: true

class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :picture
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
