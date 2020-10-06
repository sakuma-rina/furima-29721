require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '#create' do
    before do
      @order_destination = FactoryBot.build(:order_destination)
    end

    it 'post_codeが空では登録できないこと' do
      @order_destination.post_code = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
    end

    it 'state_idが空では登録できないこと' do
      @order_destination.state_id = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("State can't be blank")
    end

    it 'state_idが空では登録できないこと' do
      @order_destination.state_id = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("State can't be blank")
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

    it 'state_idが1では登録出来ないこと' do
      @order_destination.state_id = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("State can't be blank")
    end

    it 'post_codeが-はなければ登録出来ないこと' do
      @order_destination.post_code = '1234567'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Post code is invalid')
    end
  end
end
