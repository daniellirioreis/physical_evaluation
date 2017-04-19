class ExerciseDone < ActiveRecord::Base
  belongs_to :exercise_training
  
  scope :by_training_id, lambda { |training_id| where(" exercise_trainings.training_id = #{training_id}").joins(:exercise_training) }
  scope :date_equal, lambda { |date| where("exercise_dones.date = ?", date) }  

  scope :by_student_id, lambda { |student_id| where("trainings.student_id = #{student_id}").joins(:exercise_training => :training) }
  
end
