class ExerciseTrainingsController < ApplicationController
  before_action :set_exercise_training, only: [:show, :done]
  def show
    
  end

  def done
    ed = ExerciseDone.new(exercise_training_id: @exercise_training.id, done: true , date: Date.current)
    if ed.save!
      flash[:notice] = 'Exercicio concluído com sucesso.'          
      redirect_to root_path          
    else
      
    end  
  end

  private
    def set_exercise_training
      @exercise_training = ExerciseTraining.find(params[:id])
    end
  
end
