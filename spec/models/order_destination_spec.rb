require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '#create' do
    before do
      @order_destination = FactoryBot.build(:order_destination)
    end

    it 'post_codeとstate_idとcityとaddressとphone_numberとbuilding_nameは空でも登録できること' do
      expect(@order_destination).to be_valid
    end

    it 'building_nameは空でも登録できること' do
      @order_destination.building_name = nil
      expect(@order_destination).to be_valid
    end

    it 'post_codeが空では登録できないこと' do
      @order_destination.post_code = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Post code is invalid')
    end

    it 'state_idが空では登録できないこと' do
      @order_destination.state_id = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("State can't be blank")
    end

    it 'state_idが1では登録できないこと' do
      @order_destination.state_id = 1
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("State must be other than 1")
    end

    it 'cityが空では登録できないこと' do
      @order_destination.city = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空では登録できないこと' do
      @order_destination.address = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空では登録できないこと' do
      @order_destination.phone_number = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'post_codeはハイフンがなければ登録出来ないこと' do
      @order_destination.post_code = '1234567'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Post code is invalid')
    end

    it 'phone_numberはハイフンがあると登録出来ないこと' do
      @order_destination.phone_number = '080-1234-5678'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Phone number is invalid')
    end

    it 'phone_numberは12桁以上は登録出来ないこと' do
      @order_destination.phone_number = '080123456789'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
