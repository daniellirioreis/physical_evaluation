class Product < ActiveRecord::Base
  validates_presence_of :name
  scope :sorted, -> { order(:name) }
	
	def to_string
	  "#{name} -  valor sugerido: #{value_default}"
	end
end
