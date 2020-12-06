require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation,名前とフリガナ、生年月日が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameがあれば登録ができる" do
        @user.nickname = "a"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "hoge12"
        @user.password_confirmation = "hoge12"
        expect(@user).to be_valid
      end
      it "苗字の記述があれば登録できる" do
        @user.surname = "山田"
        expect(@user).to be_valid
      end
      it "名前の記述はあれば登録できる" do
        @user.name = "太郎"
        expect(@user).to be_valid
      end
      it "苗字のフリガナがあれば登録ができる" do
        @user.surname_furigana = "ヤマダ"
        expect(@user).to be_valid
      end
      it "名前のフリガナがあれば登録ができる" do
        @user.name_furigana = "タロウ"
        expect(@user).to be_valid
      end
      it "生年月日があれば登録ができる" do
        @user.birthday = "2000-01-01"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が含まれていない場合に登録ができないこと" do
        @user.email = "test.test.co.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "hoge1"
        @user.password_confirmation = "hoge1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "パスワードが数字のみの場合に登録ができないこと" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "パスワードが英字のみ場合に登録ができないこと" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "苗字が空では登録ができない" do
        @user.surname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname can't be blank")
      end
      it "名前が空では登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "苗字のフリガナが空では登録ができない" do
        @user.surname_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname furigana can't be blank")
      end
      it "名前のフリガナが空では登録ができない" do
        @user.name_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name furigana can't be blank")
      end
      it "苗字が全角漢字、ひらがな、カタカナ以外の場合に登録ができないこと" do
        @user.surname = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname is invalid. Input full-width characters.")
      end
      it "名前が全角漢字、ひらがな、カタカナ以外の場合に登録ができないこと" do
        @user.name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid. Input full-width characters.") 
      end
      it "苗字のフリガナが全角カタカナ以外の場合に登録ができないこと" do
        @user.surname_furigana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname furigana is invalid. Input full-width katakana characters.")
      end
      it "名前のフリガナが全角カタカナ以外の場合に登録ができないこと" do
        @user.name_furigana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name furigana is invalid. Input full-width katakana characters.")
      end
      it "生年月日がからでは登録ができない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end