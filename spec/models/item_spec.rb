require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

    context '商品の出品がうまくいくとき' do
      it 'name,detail,image,category_id,condition_id,delivery_charge_id,prefecture_id,delivery_time_id,priceが記述してあれば出品できる' do
        expect(@item).to be_valid
      end
      
      it 'nameが40字以内であれば出品できる' do
        @item.name = 'あ' * 40
        expect(@item).to be_valid
      end

      it 'detailが1000字以内であれば出品できる' do
        @item.detail = 'あ' * 1000
        expect(@item).to be_valid
      end

      it 'priceが300~9999999であれば出品できる' do
        @item.price = 100000
        expect(@item).to be_valid
      end
      
      it 'priceが半角入力であれば出品できる' do
        @item.price = 100000
        expect(@item).to be_valid
      end
    end 

    context '商品の出品がうまくいかないとき' do   
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが41字以上では出品できない' do
        @item.name = 'あ'* 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      
      it 'detailが空では出品できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end

      it 'detailが1001字以上では出品できない' do
        @item.detail = 'あ' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail is too long (maximum is 1000 characters)")
      end

      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      
      it 'category_idがid=1では出品できない' do
        @item.category_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      
      it 'condition_idがid=1では出品できない' do
        @item.condition_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      
      it 'delivery_charge_idがid=1では出品できない' do
        @item.delivery_charge_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
      end
      
      it 'prefecture_idがid=1では出品できない' do
        @item.prefecture_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      
      it 'delivery_time_idがid=1では出品できない' do
        @item.delivery_time_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time must be other than 1")
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      
      it 'priceが全角文字では出品できない' do
        @item.price = '１２００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")    
      end

      it 'priceが半角英数字混合では出品できない' do
        @item.price = '1000as'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")    
      end
      
      it 'priceが半角英字では出品できない' do
        @item.price = 'loo'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")    
      end

      it 'priceが300より小さければ出品できない' do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")    
      end

      it 'priceが9999999より大きければ出品できない' do
        @item.price = 9999999999999999
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")    
      end

    end
  end
end
