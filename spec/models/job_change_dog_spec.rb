require 'rails_helper'

RSpec.describe JobChangeDog, type: :model do
  before do
    @job_change_dog = FactoryBot.build(:job_change_dog)
    sleep 0.5
  end
  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば登録できること' do
      expect(@job_change_dog).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'ageは空だと登録できないこと' do
      @job_change_dog.age = ''
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("年齢を入力してください")
    end
    it 'ageは29以下ではないと登録できないこと' do
      @job_change_dog.age = 30
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("年齢は29以下の値にしてください")
    end
    it 'ageは半角数字ではないと登録できないこと' do
      @job_change_dog.age = 'あいうえお'
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("年齢は数値で入力してください", "年齢が認識できません. 半角数字で入力してください")
    end
    it 'breed_idが空だと登録できないこと' do
      @job_change_dog.breed_id = ''
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("犬の種類を入力してください")
    end
    it 'breed_idが「---」を選択している時登録できないこと' do
      @job_change_dog.breed_id = 0
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("犬の種類を選択してください")
    end
    it 'breed_idが1~4以外を選択している時登録できないこと' do
      @job_change_dog.breed_id = 6
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("犬の種類を選択してください")
    end
    it 'far_colorは空だと登録できないこと' do
      @job_change_dog.far_color = ''
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("毛色を入力してください")
    end
    it 'gender_idが空だと登録できないこと' do
      @job_change_dog.gender_id = ''
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("性別を入力してください")
    end
    it 'gender_idが1,2以外選択している時登録できないこと' do
      @job_change_dog.gender_id = 3
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("性別は不正値です。男性か女性を選んで下さい")
    end
    it 'personalityは空だと登録できないこと' do
      @job_change_dog.personality = ''
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("性格を入力してください")
    end
    it 'surgery_idが空だと登録できないこと' do
      @job_change_dog.surgery_id = ''
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("去勢・避妊手術を入力してください")
    end
    it 'surgery_idが「---」を選択している時登録できないこと' do
      @job_change_dog.surgery_id = 0
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("去勢・避妊手術を選択してください")
    end
    it 'surgery_idが1,2以外を選択している時登録できないこと' do
      @job_change_dog.surgery_id = 10
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("去勢・避妊手術を選択してください")
    end
    it 'vaccine_idが空だと登録できないこと' do
      @job_change_dog.vaccine_id = ''
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("ワクチン接種を入力してください")
    end
    it 'vaccine_idが「---」を選択している時登録できないこと' do
      @job_change_dog.vaccine_id = 0
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("ワクチン接種を選択してください")
    end
    it 'vaccine_idが1~4以外を選択している時登録できないこと' do
      @job_change_dog.vaccine_id = 99
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("ワクチン接種を選択してください")
    end
    it 'publicationは空だと登録できないこと' do
      @job_change_dog.publication = ''
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("希望譲渡を入力してください")
    end
    it 'wordは空だと登録できないこと' do
      @job_change_dog.word = ''
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("Wordを入力してください")
    end
    it 'priceは空だと登録できないこと' do
      @job_change_dog.price = ''
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("支援金を入力してください", "支援金は数値で入力してください", "支援金は不正な値です")
    end 
    it 'priceは9999999以下ではないと登録できないこと' do
      @job_change_dog.price = 100000000000000
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("支援金は9999999以下の値にしてください")
    end 
    it 'priceは半角数字ではないと登録できないこと' do
      @job_change_dog.price = 'aaa'
      @job_change_dog.valid?
      expect(@job_change_dog.errors.full_messages).to include("支援金は数値で入力してください")
    end 
  end
end
