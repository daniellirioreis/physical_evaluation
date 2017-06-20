class TypeSale < EnumerateIt::Base
  associate_values :in_cash                             => 0,
                   :in_installment                      => 1
                   
end