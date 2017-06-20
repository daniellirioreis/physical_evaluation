class Sale < ActiveRecord::Base
  attr_accessor :student_name, :package_name  
  
  belongs_to :student
  belongs_to :package
  has_many :installments
  
  has_enumeration_for :type_sale, with: TypeSale, :create_helpers => true, :create_scopes => true
	
	scope :by_type_sale, lambda { |type| where("sales.type_sale = ?", type) }
	scope :by_done, lambda { |done| where("sales.done = ?", done) }
  
	
	
	before_update :generate_discount_or_installment
	
	
	def status
    if done
      if installment?
        if count_installments_not_paid.zero? 
         1
        else
          0
        end
      else
        1
      end
    else
      0
    end
  end
  
	def value_installments_paid	 
	 installments.paid(true).sum(:price)	 
	end
	
	def value_installments_not_paid	 
	 installments.paid(false).sum(:price)	 
	end
	
	def count_installments_paid
	 installments.paid(true).count
	end
	def count_installments_not_paid
	 installments.paid(false).count
	end
	
	private 

	def generate_discount_or_installment
    if done
      if installment?
        write_attribute(:price , package.price )
        price_installment = package.price / installment
        (1..installment).each do |i|
          ins = Installment.new(number: i, price: price_installment, sale: self, done: false) 
          ins.save!
        end	      
      else
        d = ( (discount.to_f / 100  ) * package.price)
        d = package.price - d
        write_attribute(:price , d )
      end	    	    
    end	 
	end	
end
