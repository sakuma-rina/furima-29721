require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    end

    it "product_nameが空では登録できないこと" do
      @item.product_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end

    it "descriptionが空では登録できないこと" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "category_idが空では登録出来ないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
     end

     it "condition_id が空では登録出来ないこと" do
      @item.condition_id  = nil
      @item.valid?
     expect(@item.errors.full_messages).to include("Condition is not a number")
     end

     it "fee_idが空では登録出来ないこと" do
      @item.fee_id   = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee is not a number")
     end

     it "address_idが空では登録出来ないこと" do
      @item.address_id  = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Address is not a number")
     end

     it "days_idが空では登録出来ないこと" do
      @item.days_id = nil
      @item.valid?
       expect(@item.errors.full_messages).to include("Days is not a number")
     end

     it "priceが300未満では登録出来ないこと" do
      @item.price =  1
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
     end

     it"priceが10_000_000以上では登録出来ないこと" do
      @item.price =  10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
     end

     it"imageが空では登録出来ないこと" do
      @item.image =  nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
     end

     it "category_idが1では登録出来ないこと" do
      @item.category_id = 1
      @item.valid?
     expect(@item.errors.full_messages).to include("Category must be other than 1")
     end

     it "condition_id が1では登録出来ないこと" do
      @item.condition_id  = 1
      @item.valid?
     expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it "fee_idが1では登録出来ないこと" do
      @item.fee_id   = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee must be other than 1")
     end

     it "address_idが1では登録出来ないこと" do
      @item.address_id  = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Address must be other than 1")
     end

     it "days_idが1では登録出来ないこと" do
      @item.days_id =1
      @item.valid?
       expect(@item.errors.full_messages).to include("Days must be other than 1")
     end

end



