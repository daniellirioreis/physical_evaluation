class Installment < ActiveRecord::Base
  belongs_to :sale
  
  scope :paid, lambda { |done| where("installments.done = ?", done) }
  scope :sorted, -> { order(:number) }
  
end
