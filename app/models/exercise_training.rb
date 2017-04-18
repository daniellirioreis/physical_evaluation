class ExerciseTraining < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :training
  delegate :student, to: :training
  delegate :grupo_muscular, :musculo, to: :exercise
  
  delegate :student_id, to: :student
  
  validates :exercise_id, presence: :true
  
  def to_s
  	exercise	
  end
end
