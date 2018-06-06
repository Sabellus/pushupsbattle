class CreateTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :trainings do |t|
      t.references :user, foreign_key: true
      t.integer :count
      t.integer :approaches
      t.string :comments

      t.timestamps
    end
  end
end
