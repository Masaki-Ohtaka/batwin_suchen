require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
  @comment = FactoryBot.build(:comment)
  binding.pry
  end
  context 'コメントできるとき' do
    it '全ての条件が満たしていればコメントすることができる' do
      expect(@commnet).to be_valid
    end
  end
end
