class Car < ActiveRecord::Base
  validates_presence_of :make, :model, :mileage

  def self.by_model
    order(:model)
  end

  def self.by_make
    order(:make)
  end

  def self.by_price(high = false)
    if high
      order(price: :desc)
    else
      order(:price)
    end
  end

  def paint(color)
    self.update(color: color)
  end

  def info
    {make: self.make, model: self.model, mileage: self.mileage, color: self.color, interior: self.interior, age: self.age, price: self.price}
  end

  def honk
    'Beep'
  end
end
