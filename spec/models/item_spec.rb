require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "出品画像と商品名、商品の説明、商品の詳細のカテゴリーと商品の状態、配送料についての配送料の負担、発送元の地域、発送までの日数と販売価格があれば出品できる" do
        expect(@item).to be_valid
      end
      it "商品名が40文字以下であれば出品できる" do
        @item.title = "a"
        expect(@item).to be_valid
      end
      it "商品の説明が1000文字以下であれば出品できる" do
        @item.text = "a"
        expect(@item).to be_valid
      end
      it "カテゴリーがあれば出品できる" do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it "商品の状態があれば出品ができる" do
        @item.status_id = 2
        expect(@item).to be_valid
      end
      it "配送料の負担があれば出品ができる" do
        @item.shipping_charges_id = 2
        expect(@item).to be_valid
      end
      it "発送元の地域があれば出品ができる" do
        @item.shipment_source_id = 2
        expect(@item).to be_valid
      end
      it "発送までの日数があれば出品ができる" do
        @item.day_to_ship_id = 2
        expect(@item).to be_valid
      end
      it "販売価格があれば出品ができる" do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "出品画像が空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空では出品できない" do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "商品名が41文字以上だと出品できない" do
        @item.title = "a" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Title is too long (maximum is 40 characters)")
      end
      it "商品の説明が空では出品できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "商品の説明が1000文字以上では出品できない" do
        @item.text = "a" * 1000
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it "カテゴリーが---では出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態が---では出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "配送料の負担が---では出品できない" do
        @item.shipping_charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
      end
      it "発送元の地域が---では出品ができないこと" do
        @item.shipment_source_id = 2
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it "発送までの日数が---では出品ができないこと" do
        @item.shipment_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it "販売価格が¥299以下では出品ができない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "販売価格が¥10,000,000以上では出品ができない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
