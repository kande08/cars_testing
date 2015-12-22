require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'attributes' do
    it {should respond_to :make}
    it {should respond_to :model}
    it {should respond_to :age}
    it {should respond_to :price}
    it {should respond_to :color}
    it {should respond_to :interior}
    it {should respond_to :mileage}
  end

  describe 'validations' do
    it {should validate_presence_of :make}
    it {should validate_presence_of :model}
    it {should validate_presence_of :mileage}
  end

  describe 'sorting' do
    before(:each) do
      @car1 = Car.create(make: 'Toyota', model: 'Prius', mileage: 2100, price: 30000)
      @car2 = Car.create(make: 'Ford', model: 'Focus', mileage: 21000, price: 10000)
      @car3 = Car.create(make: 'Nissan', model: 'Pathfinder', mileage: 10000, price: 15000)
    end

    it 'sorts by make' do
      cars = Car.by_make
      expect(cars.first).to eq(@car2)
      expect(cars[1]).to eq(@car3)
      expect(cars.last).to eq(@car1)
    end

    it 'sorts by model' do
      cars = Car.by_model
      expect(cars.first).to eq(@car2)
      expect(cars[1]).to eq(@car3)
      expect(cars.last).to eq(@car1)
    end

    it 'sorts by price high to low' do
      cars = Car.by_price(true)
      expect(cars.first).to eq(@car1)
      expect(cars[1]).to eq(@car3)
      expect(cars.last).to eq(@car2)
    end

    it 'sorts by price low to high' do
      cars = Car.by_price
      expect(cars.first).to eq(@car2)
      expect(cars[1]).to eq(@car3)
      expect(cars.last).to eq(@car1)
    end
  end

  describe 'instance methods' do
    it 'paints the car' do
      color = 'Orange'
      car = Car.create(make: 'Toyota', model: 'Prius', mileage: 1, color: 'Red')
      car.paint(color)
      expect(car.color).to eq(color)
    end

    it 'returns the info' do
      car = Car.create(make: 'Toyota', model: 'Prius', mileage: 1, color: 'Red', price: 10000.0, age: 2015, interior: 'Blue')
      car_hash = {make: car.make, model: car.model, mileage: car.mileage, color: car.color, interior: car.interior, age: car.age, price: car.price}
    end

    it 'beeps the horn' do
      car = Car.create(make: 'Toyota', model: 'Prius', mileage: 0)
      expect(car.honk).to eq('Beep')
    end
  end
end
