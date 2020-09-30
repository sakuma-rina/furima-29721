require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "last_name_kanaが空では登録できないこと" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it 'last_nameが全角でなければ登録できないこと' do
      @user.last_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
     
    it 'first_name_kanaが半角カタカナでは登録できないこと' do
      @user.first_name_kana = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it 'last_name_kanaが半角カタカナでは登録できないこと' do
        @user.last_name_kana = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
        end


     it "emailが空では登録できないこと" do
       @user.email = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end     

     it "passwordが空では登録できないこと" do
       @user.password = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
     end

     it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
       @user.password_confirmation = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

     it "birthdayが空では登録出来ないこと" do
       @user.birthday = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end


      it "emailが@を含む必要があること" do
          @user.email =  "testtest"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end   
  end
end
