class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.references :event, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :route_url

      t.timestamps
    end
  end
end
