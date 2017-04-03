class AddQuantDiasAvisoAvaliacaoToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :quant_dias_aviso_avaliacao, :integer
  end
end
