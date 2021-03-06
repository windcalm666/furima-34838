require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context "新規登録できる時" do
    it "全ての情報が入力されていれば登録できる" do
      expect(@user).to be_valid
    end
    it "nicknameが入力されていれば登録できる" do
      @user.nickname = "test"
      expect(@user).to be_valid
    end
    it "emailが入力されていれば登録できる" do
      @user.email = "sample@gmail.com"
      expect(@user).to be_valid
    end
    it "passwordとpassword_confirmationが6文字以上で英数字が含まれているなら登録できる" do
      @user.password = "123abc"
      @user.password_confirmation = @user.password
      expect(@user).to be_valid
    end
    it "first_nameが全角で入力されていれば登録できる" do
      @user.first_name = "試験"
      expect(@user).to be_valid
    end
    it "last_nameが全角で入力されていれば登録できる" do
      @user.last_name = "試験"
      expect(@user).to be_valid
    end
    it "first_name_readが全角カタカナで入力されていれば登録できる" do
      @user.first_name_read = "シケンヨミ"
      expect(@user).to be_valid
    end
    it "last_name_readが全角カタカナで入力されていれば登録できる" do
      @user.last_name_read = "シケンヨミ"
      expect(@user).to be_valid
    end
    it "birthdayが入力されていれば登録できる" do
      @user.birthday = "2000-01-01"
      expect(@user).to be_valid
    end
  end

  context "新規登録できない時" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailが重複していると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに@が含まれていないと登録できない" do
      @user.email = "testemail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下だと登録できない" do
      @user.password = "123ab"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordがアルファベットだけだと登録できない" do
      @user.password = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it "passwordが数字だけだと登録できない" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it "passwordが全角だと登録できない" do
      @user.password = "１２３ABC"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it "passwordが存在してもpassword_confirmationが空だと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "first_nameが半角含む英数字だと登録できない" do
      @user.first_name = "test１２３"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "last_nameが半角含む英数字だと登録できない" do
      @user.last_name = "test１２３"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end
    it "first_name_readが空だと登録できない" do
      @user.first_name_read = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name read can't be blank")
    end
    it "first_name_readが半角含む英数字だと登録できない" do
      @user.first_name_read = "test１２３"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name read Full-width katakana characters")
    end
    it "first_name_readが全角カタカナ以外だと登録できない" do
      @user.first_name_read = "試験"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name read Full-width katakana characters")
    end
    it "last_name_readが空だと登録できない" do
      @user.last_name_read = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name read can't be blank")
    end
    it "last_name_readが半角含む英数字だと登録できない" do
      @user.last_name_read = "test１２３"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name read Full-width katakana characters")
    end
    it "last_name_readがカタカナでないと登録できない" do
      @user.last_name_read = "試験"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name read Full-width katakana characters")
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end

  context "ログインできる時" do
    it "emailとpasswordが入力されていればログインできる" do
      expect(@user).to be_valid
    end
  end

  context "ログインできない時" do
    it "emailが空だとログインできない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空だとログインできない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
  end
end
