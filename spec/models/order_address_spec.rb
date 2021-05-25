require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "購入情報の登録" do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '購入できる場合'do
      it '全ての値(カード情報と配送先)が正しければ購入できる' do
        expect(@order_address).to be_valid
      end
      
      it 'building_nameが空でも購入できる'do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できない場合'do
      it 'postal_codeが空であれば購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      
      it 'postal_codeが半角数字であってもハイフン無しであれば購入できない' do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is valid. Include hyphen(-)")
      end

      it 'postal_codeがハイフンがあっても全角数字であれば購入できない' do
        @order_address.postal_code = "１２３-４５６７"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is valid. Include hyphen(-)")
      end
      
      it 'prefecture_idが1であれば購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      
      it 'municipalityが空であれば購入できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'house_numberが空であれば購入できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空であれば購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11字でなければ購入できない' do
        @order_address.phone_number = '12345678901234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is the wrong length (should be 11 characters)")
      end

      it 'phone_numberが全角であれば購入できない' do
        @order_address.phone_number = '１２３４５６７８９１０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      
      it 'tokenが空であれば購入できない'do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

   end
    
  end
end
