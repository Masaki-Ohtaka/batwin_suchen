require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
  @job_change_dog = FactoryBot.create(:job_change_dog)
  @user = FactoryBot.create(:user)
  @foundation = FactoryBot.create(:foundation)
  @comment = FactoryBot.build(:comment)
  end
  context 'コメントできるとき' do
    it 'userと紐づいている時コメントすることができる' do
      # user = FactoryBot.create(:user)
      @comment = FactoryBot.build(:comment, job_change_dog_id: @job_change_dog.id,user_id: @user.id)
      expect(@comment).to be_valid
    end
    it 'foundationと紐づいている時コメントすることができる' do
      @comment = FactoryBot.build(:comment, job_change_dog_id: @job_change_dog.id, foundation_id: @foundation.id)
      expect(@comment).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'userと紐づいている時でtextが空だと登録できないこと' do
      @comment = FactoryBot.build(:comment, job_change_dog_id: @job_change_dog.id,user_id: @user.id)
      @comment.text = ''
      @comment.valid?
      expect(@comment.errors.full_messages).to include("内容を入力してください")
    end
    it 'foundationと紐づいている時でtextが空だと登録できないこと' do
      @comment = FactoryBot.build(:comment, job_change_dog_id: @job_change_dog.id,foundation_id: @foundation.id)
      @comment.text = ''
      @comment.valid?
      expect(@comment.errors.full_messages).to include("内容を入力してください")
    end
  end
end
