require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
  job_change_dog = FactoryBot.create(:job_change_dog)
  @comment = FactoryBot.build(:comment,job_change_dog_id: job_change_dog.id)
  end
  context 'コメントできるとき' do
    it 'ユーザーと紐づいている時コメントすることができる' do
      user = FactoryBot.create(:user)
      @comment = FactoryBot.build(:comment, user_id: user.id)
      expect(@comment).to be_valid
    end
  end
end
