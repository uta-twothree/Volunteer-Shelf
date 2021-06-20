require 'rails_helper'

RSpec.describe Album, type: :model do
  before do
    @album = FactoryBot.build(:album)
  end

  describe '作成するアルバムの登録' do
    context 'アルバムを登録できるとき' do
      it 'nameとcontent、image,areaとthemeが存在すれば登録できる' do
        expect(@album).to be_valid
      end
    end

    context 'アルバムを登録できないとき' do
      it 'nameが空では登録できない' do
        @album.name = ''
        @album.valid?
        expect(@album.errors.full_messages).to include("Name can't be blank")
      end

      it 'contentが空では登録できない' do
        @album.content = ''
        @album.valid?
        expect(@album.errors.full_messages).to include("Content can't be blank")
      end

      it 'imageが空では登録できない' do
        @album.image = nil
        @album.valid?
        expect(@album.errors.full_messages).to include("Image can't be blank")
      end

      it 'areaが空では登録できない' do
        @album.area_id = ''
        @album.valid?
        expect(@album.errors.full_messages).to include("Area can't be blank")
      end

      it 'areaのidが1の時は登録できない' do
        @album.area_id = 1
        @album.valid?
        expect(@album.errors.full_messages).to include("Area can't be blank")
      end

      it 'themeが空では登録できない' do
        @album.theme_id = ''
        @album.valid?
        expect(@album.errors.full_messages).to include("Theme can't be blank")
      end

      it 'themeのidが1の時は登録できない' do
        @album.theme_id = 1
        @album.valid?
        expect(@album.errors.full_messages).to include("Theme can't be blank")
      end
    end
  end
end
