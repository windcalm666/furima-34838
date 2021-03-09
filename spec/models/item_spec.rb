require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context "出品できる時" do
    it "全ての情報が入力されていれば出品できる" do
      expect(@item).to be_valid
    end
    it "itemが入力されていれば出品できる" do
      @item.item = "テスト"
      expect(@item).to be_valid
    end
    it "textが入力されていれば出品できる" do
      @item.text = "説明のテストテキスト"
      expect(@item).to be_valid
    end
    it "priceが半角で300~9999999で入力されていれば出品できる" do
      @item.price = 5000
      expect(@item).to be_valid
    end
    it "category_idが1以外を選択していれば出品できる" do
      @item.category_id = 4
      expect(@item).to be_valid
    end
    it "status_idが1以外を選択していれば出品できる" do
      @item.status_id = 3
      expect(@item).to be_valid
    end
    it "charge_idが1以外を選択していれば出品できる" do
      @item.charge_id = 2
      expect(@item).to be_valid
    end
    it "day_idが1以外を選択していれば出品できる" do
      @item.day_id = 3
      expect(@item).to be_valid
    end
    it "prefecture_idが1以外を選択していれば出品できる" do
      @item.prefecture_id = 10
      expect(@item).to be_valid
    end
    it "imageが添付されていれば出品できる" do
      @item.image = nil
      @item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      expect(@item).to be_valid
    end
  end
  context "出品できない時" do
    it "itemが入力されていないと出品できない" do
      @item.item = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item can't be blank")
    end
    it "textが入力されていないと出品できない" do
      @item.text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it "priceが入力されていないと出品できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが300以下だと出品できない" do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it "priceが9999999以上だと出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it "priceが全角だと出品できない" do
      @item.price = "５０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it "category_idが1だと出品できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end
    it "status_idが1だと出品できない" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status Select")
    end
    it "charge_idが1だと出品できない" do
      @item.charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Charge Select")
    end
    it "day_idが1だと出品できない" do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Day Select")
    end
    it "prefegture_idが1だと出品できない" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture Select")
    end
    it "imageが添付されていないと出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end
