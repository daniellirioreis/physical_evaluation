class DashboardController < ApplicationController
	def index
	  @trainings = []
		@evaluations = []
		if current_user.student?
		  @week_day_current = Date.current.wday
	    @trainings = current_user.student.trainings
		else
		  @evaluations =  Evaluation.are_due(Date.current + current_company.quant_dias_aviso_avaliacao.day)  		
		  @evaluations_by_expired =  Evaluation.by_expired(Date.current)  				  
		end  
	end
end
