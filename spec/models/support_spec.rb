require 'rails_helper'

RSpec.describe Support, type: :model do
  before do
    user = FactoryBot.create(:user)
    job_change_dog = FactoryBot.create(:job_change_dog)
    @support = FactoryBot.build(:support, user_id: user.id, job_change_dog_id: job_change_dog.id)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@support).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'クレジットカード情報が空だと登録できないこと' do
      @support.token = ''
      @support.valid?
      expect(@support.errors.full_messages).to include("カード情報を入力してください")
    end
  end
end
