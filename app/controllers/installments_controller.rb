class InstallmentsController < ApplicationController
  before_action :set_installment, only: [:done]
  
  def done
    if @installment.done
      @installment.update_attribute(:done, false)      
      flash[:notice] = 'Parcela não foi paga.'                
    else
      @installment.update_attribute(:done, true)        
      flash[:notice] = 'Parcela paga com sucesso.'          
    end
    redirect_to @installment.sale        
  end

  private

  def set_installment
    @installment = Installment.find(params[:id])    
  end
  
end
