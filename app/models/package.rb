class Package < ActiveRecord::Base
  validates_presence_of :name
  has_many :item_packages, dependent: :destroy
  accepts_nested_attributes_for :item_packages, reject_if: :all_blank, allow_destroy: true  
  scope :sorted, -> { order(:name) }
  
  def price
    item_packages.sum(:price)
  end
end
