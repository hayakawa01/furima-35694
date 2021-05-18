require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録/ユーザー情報' do
    it 'nickname,email,password,passeord_confirmation,first_name,last_name,first_name_kana,last_name_kana,birth_dateが全て記入されていれば登録できる' do
      
    it 'nicknameが空では登録できない' do
      
    end
    it 'emaileが空では登録できない' do
      
    end
    it 'emailが重複している場合は登録できない' do
      
    end
    it 'passwordが空では登録できない' do
      
    end
    it 'passeord_confirmationが空では登録できない' do
      
    end
    it 'passwordが6文字以上でなければ登録できない' do
      
    end
    it 'passwordが半角英数混合でなければ登録できない' do
      
    end
    it 'passwordとpasseord_confirmationが一致していなければ登録できない' do
      
    end
    it 'first_nameが空では登録できない' do
      
    end
    it 'first_nameが全角でなければ登録できない' do
      
    end
    it 'last_nameが空では登録できない' do
      
    end
    it 'last_nameが全角でなければ登録できない' do
      
    end
    it 'first_name_kanaが空では登録できない' do
      
    end
    it 'first_name_kanaが全角でなければ登録できない' do
      
    end
    it 'last_name_kanaが空では登録できない' do
      
    end
    it 'last_name_kanaが全角でなければ登録できない' do
      
    end
    it 'birth_dateが空では登録できない' do
      
    end

  end
end


Input full-width characters
Input full-width katakana characters
Include both letters and numbers