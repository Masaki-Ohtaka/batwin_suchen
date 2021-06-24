class CreateJobChangeDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :job_change_dogs do |t|
      t.string     :name,        null: false
      t.integer    :breed_id,    null: false
      t.string     :far_color,   null: false
      t.integer    :gender_id,   null: false
      t.string     :personality, null: false
      t.integer    :surgery_id,  null: false
      t.integer    :vaccine_id,  null: false
      t.date       :publication, null: false
      t.text       :word,        null: false
      t.references :foundation, foreign_key: true
      t.timestamps
    end
  end
end
