require 'rails_helper'

RSpec.describe Dog, type: :model do
  before do
    @job_change_dog = FactoryBot.build(:job_change_dog)
    @job_change_dog.save!
  end
  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@job_change_dog).to be_valid
    end
  end
  context '内容に問題がある場合' do
    it 'dog_idが5枚の投稿の時' do
      5.times do 
        @job_change_dog.dogs.create!
      end
      # expect(@job_change_dog).to be_invalid
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("Imageは4枚以内にしてください")
    end
  end
end

