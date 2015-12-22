require 'rails_helper'

RSpec.describe Part, type: :model do
  describe 'attributes' do
    it {should respond_to :name}
    it {should respond_to :price}
    it {should respond_to :manufacturer}
    it {should respond_to :quantity}
  end

  describe 'class methods' do
    before(:each) do
      @part1 = Part.create(name: 'transmission', price: 750.0, manufacturer: 'GMC', quantity: 5)
      @part2 = Part.create(name: 'apple', price: 1.0, manufacturer: 'Toyota', quantity: 75)
      @part3 = Part.create(name: 'zebra', price: 100000.0, manufacturer: 'Holden', quantity: 600)
    end

    it 'sorts by name' do
      parts = Part.by_name
      expect(parts.first).to eq(@part2)
      expect(parts[1]).to eq(@part1)
      expect(parts.last).to eq(@part3)
    end

    it 'sorts by price high to low' do
      parts = Part.by_price(true)
      expect(parts.first).to eq(@part3)
      expect(parts[1]).to eq(@part1)
      expect(parts.last).to eq(@part2)
    end

    it 'sorts by price low to high' do
      parts = Part.by_price
      expect(parts.first).to eq(@part2)
      expect(parts[1]).to eq(@part1)
      expect(parts.last).to eq(@part3)
    end

    it 'sorts by manufacturer' do
      parts = Part.by_manufacturer
      expect(parts.first).to eq(@part1)
      expect(parts[1]).to eq(@part3)
      expect(parts.last).to eq(@part2)
    end

    it 'sorts by quantity' do
      parts = Part.by_quantity
      expect(parts.first).to eq(@part1)
      expect(parts[1]).to eq(@part2)
      expect(parts.last).to eq(@part3)
    end

    it 'gets by price under ten' do
      parts = Part.under_ten
      expect(parts.first).to eq(@part2)
    end

    it 'gets by price over ten and manufacturer GMC' do
      parts = Part.over_ten_and_GMC
      expect(parts.first).to eq(@part1)
    end
  end

  describe 'instance methods' do
    it 'subtracts one from the quantity' do
      part1 = Part.create(name: 'transmission', price: 750.0, manufacturer: 'GMC', quantity: 5)
      part1.purchase
      expect(part1.quantity).to eq(4)
    end

    it 'does not subtract one from quantity if quantity is zero' do
      part1 = Part.create(name: 'transmission', price: 750.0, manufacturer: 'GMC', quantity: 0)
      part1.purchase
      expect(part1.quantity).to eq(0)
    end
  end
end
