class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.text        :image_url
      
      t.references  :job_change_dog, foreign_key: true
      t.timestamps
    end
  end
end
