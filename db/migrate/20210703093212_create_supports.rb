class CreateSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :supports do |t|
      t.references :user,           null: false,foreign_key: true
      t.references :job_change_dog, null: false,foreign_key: true


      t.timestamps
    end
  end
end
