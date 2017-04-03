class EvaluationMailer < ApplicationMailer
  def notice(evaluation)
     @evaluation = evaluation
     # mail :to => "#{evaluation.student.email}", :from => "#{evaluation.company.email}", :subject => "Avaliação física há vencer"
     mail to: "daniellirioreis@gmail.com"     
   end  
   
end
