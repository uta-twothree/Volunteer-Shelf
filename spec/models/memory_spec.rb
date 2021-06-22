require 'rails_helper'

RSpec.describe Memory, type: :model do
  before do
    @memory = FactoryBot.build(:memory)
  end

  describe '作成するメモリーの登録' do
    context 'メモリーを登録できるとき' do
      it 'titleとdate、imagesとtextが存在すれば登録できる' do
        expect(@memory).to be_valid
      end
    end

    context 'メモリーを登録できないとき' do
      it 'titleが空では登録できない' do
        @memory.title = ''
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Title can't be blank")
      end

      it 'dateが空では登録できない' do
        @memory.date = ''
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Date can't be blank")
      end

      it 'imagesが空では登録できない' do
        @memory.images = nil
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Images can't be blank")
      end

      it 'textが空では登録できない' do
        @memory.text = ''
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Text can't be blank")
      end

      it 'userが紐づいていなければ登録できない' do
        @memory.user = nil
        @memory.valid?
        expect(@memory.errors.full_messages).to include("User must exist")
      end

      it 'albumが紐づいていなければ登録できない' do
        @memory.album = nil
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Album must exist")
      end
    end
  end
end
