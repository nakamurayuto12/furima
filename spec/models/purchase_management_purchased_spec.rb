require 'rails_helper'

RSpec.describe PurchaseManagementPurchased, type: :model do
  before do
    user1 = FactoryBot.create(:user)
    item =FactoryBot.create(:item, user_id: user1.id)
    user2 = FactoryBot.create(:user)
    @purchase_management_purchased = FactoryBot.build(:purchase_management_purchased, user_id: user2.id, item_id: item.id)
    sleep(0.5)
  end
  describe '購入機能' do
    context '商品購入がうまくいくとき' do
      it "郵便番号、都道府県、市町村、番地、電話番号,tokenがあれば購入ができる" do
        expect(@purchase_management_purchased).to be_valid
      end
      it '建物番号が空でも登録できる' do
        @purchase_management_purchased.building = ""
        expect(@purchase_management_purchased).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "郵便番号が空だと登録できない" do
        @purchase_management_purchased.postal_code = ''
        @purchase_management_purchased.valid?
        expect(@purchase_management_purchased.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号に「-」がないと購入ができない" do
        @purchase_management_purchased.postal_code = 1234567
        @purchase_management_purchased.valid?
        expect(@purchase_management_purchased.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が---では登録できない' do
        @purchase_management_purchased.address_id = 0
        @purchase_management_purchased.valid?
        expect(@purchase_management_purchased.errors.full_messages).to include("Address must be other than 0")
      end
      it '市町村が空では登録できない' do
        @purchase_management_purchased.municipalities = ''
        @purchase_management_purchased.valid?
        expect(@purchase_management_purchased.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空では登録できない' do
        @purchase_management_purchased.shipping_address = ''
        @purchase_management_purchased.valid?
        expect(@purchase_management_purchased.errors.full_messages).to include("Shipping address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @purchase_management_purchased.phone_number = ''
        @purchase_management_purchased.valid?
        expect(@purchase_management_purchased.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が12桁以上では登録できない' do
        @purchase_management_purchased.phone_number = '090123456789'
        @purchase_management_purchased.valid?
        expect(@purchase_management_purchased.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では登録できないこと' do
        @purchase_management_purchased.token = nil
        @purchase_management_purchased.valid?
        expect(@purchase_management_purchased.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end