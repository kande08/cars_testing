class Part < ActiveRecord::Base
  def self.by_name
    order(:name)
  end

  def self.by_price(high = false)
    if high
      order(price: :desc)
    else
      order(:price)
    end
  end

  def self.by_manufacturer
    order(:manufacturer)
  end

  def self.by_quantity
    order(:quantity)
  end

  def self.under_ten
    where("price < 10.0")
  end

  def self.over_ten_and_GMC
    where("price > 10.0 and manufacturer = 'GMC'")
  end

  def purchase
    self.quantity -= 1 if self.quantity > 0 
  end
end
