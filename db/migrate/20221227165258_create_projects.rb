class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :employee
      t.datetime :startdate
      t.datetime :enddate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
