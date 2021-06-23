class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string     :image_id

      t.references :job_change_dog, foreign_key: true
      t.timestamps
    end
  end
end
