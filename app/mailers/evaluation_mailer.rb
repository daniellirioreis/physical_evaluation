class EvaluationMailer < ApplicationMailer
  def notice(evaluation)
     @evaluation = evaluation
     mail :to => "#{evaluation.student.email}", :from => "#{evaluation.company.email}", :subject => "Avaliação física à vencer"
   end  

   def result(evaluation)
      @evaluation = evaluation
      mail :to => "#{evaluation.student.email}", :from => "#{evaluation.company.email}", :subject => "Resultado da Avaliação"
    end  
   
end
