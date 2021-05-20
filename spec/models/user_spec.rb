require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do

    context '新規登録がうまくいくとき' do
      it 'nickname,email,password,passeord_confirmation,first_name,last_name,first_name_kana,last_name_kana,birth_dateが全て記入されていれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが６文字以上の半角英数字混合であれば登録できる' do
        @user.password = "000aaa"
        @user.password_confirmation = "000aaa"
        expect(@user).to be_valid
      end
      it 'first_nameが全角であれば登録できる' do
        @user.first_name = "山田"
        expect(@user).to be_valid
      end
      it 'last_nameが全角であれば登録できる' do
        @user.last_name = "太郎"
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角であれば登録できる' do
        @user.first_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end
      it 'last_name_kanaが全角であれば登録できる' do
        @user.last_name_kana = "タロウ"
        expect(@user).to be_valid
      end
    end 

    context '新規登録がうまくいかないとき' do   
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      
      it 'emailが重複している場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user,email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailに@が入っていない場合は登録できない' do
        @user.email = "testcom"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      
      it 'passeord_confirmationがpasswordと一致しなければ登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it 'passwordが6文字以上でなければ登録できない' do
        @user.password = "12343"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      
      it 'passwordが半角英数混合でなければ登録できない' do
        @user.password = "eeeeあee"
        @user.password_confirmation ="eeeeあee"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は、半角英数字混合での入力が必須です")
      end

      it 'passwordが全角では登録できない' do
        @user.password = "ｐｐｐｐｐｐ"
        @user.password_confirmation = "ｐｐｐｐｐｐ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は、半角英数字混合での入力が必須です")
      end
      
      it 'passwordが数字のみでは登録できない' do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は、半角英数字混合での入力が必須です")

      end
      it 'passwordが英語のみでは登録できない' do
        @user.password = "pppppp"
        @user.password_confirmation = "pppppp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は、半角英数字混合での入力が必須です")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      
      it 'first_nameが全角でなければ登録できない' do
        @user.first_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は、全角での入力が必須です")
      end
      
      it 'last_nameが空では登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      
      it 'last_nameが全角でなければ登録できない' do
        @user.last_name = "suzuki"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は、全角での入力が必須です")
      end
      
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
  
      end
      
      it 'first_name_kanaが全角でなければ登録できない' do
        @user.first_name_kana = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana は、全角カタカナでの入力が必須です")
  
      end
      
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
  
      end
      
      it 'last_name_kanaが全角でなければ登録できない' do
        @user.last_name_kana = "suzuki"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana は、全角カタカナでの入力が必須です")
  
      end
      
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end

  end
end


