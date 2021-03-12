require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "購入機能のテスト" do

    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context "購入できる時" do
      it "全ての情報が入力されていれば購入できる" do
        expect(@order_address).to be_valid
      end
      it "postal_cordが正しく入力されていれば購入できる" do
        @order_address.postal_cord = "123-4567"
        expect(@order_address).to be_valid
      end
      it "prefecture_idが1以外なら購入できる" do
        @order_address.prefecture_id = 10
        expect(@order_address).to be_valid
      end
      it "cityが入力されていれば購入できる" do
        @order_address.city = "東京都"
        expect(@order_address).to be_valid
      end
      it "addressが入力されていれば購入できる" do
        @order_address.address = "1-1-1"
        expect(@order_address).to be_valid
      end
      it "building_nameが入力されていなくても購入できる" do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
      it "building_nameが入力されていても購入できる" do
        @order_address.building_name = "東京ハイツ"
        expect(@order_address).to be_valid
      end
      it "phone_numberが正しく11字以内の半角数字なら購入できる" do
        @order_address.phone_number = "09012345678"
        expect(@order_address).to be_valid
      end
      it "tokenが生成されていれば購入できる" do
        @order_address.token = "tok_abcdefghijk00000000000000000"
        expect(@order_address).to be_valid
      end
    end

    context "購入できない時" do
      it "postal_cordが空だと購入できない" do
        @order_address.postal_cord = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal cord can't be blank")
      end
      it "postal_cordに-が抜けていると購入できない" do
        @order_address.postal_cord = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal cord Input correctly")
      end
      it "postal_cordが全角数字だと購入できない" do
        @order_address.postal_cord = "１２３-４５６７"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal cord Input correctly")
      end
      it "prefcuture_idが1だと購入できない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture Select")
      end
      it "cityが空だと購入できない" do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空だと購入できない" do
        @order_address.address = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空だと購入できない" do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが全角数字だと購入できない" do
        @order_address.phone_number = "０９０１２３４５６７８"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is not a number")
      end
      it "phone_numberが英数字混合だと購入できない" do
        @order_address.phone_number = "0901234abcd"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is not a number")
      end
      it "phone_numberが12桁以上だと購入できない" do
        @order_address.phone_number = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空だと購入できない" do
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空だと購入できない" do
          @order_address.user_id = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空だと購入できない" do
        @order_address.item_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
