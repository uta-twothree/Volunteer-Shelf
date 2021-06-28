require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe '投稿するコメントの登録' do
    context 'コメントを保存できるとき' do
      it 'textが存在していれば保存できること' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントを保存できないとき' do
      it 'textが空では保存できないこと' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end

      it 'albumが紐付いていないと保存できないこと' do
        @comment.album = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Album must exist")
      end

      it 'userが紐付いていないと保存できないこと' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
    end
  end
end
