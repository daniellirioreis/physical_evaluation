class ItemPackage < ActiveRecord::Base
  belongs_to :product
  belongs_to :package
  
  def to_s
    product.name
  end
end
