class ExerciseTraining < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :training
  has_many :exercise_dones, dependent: :destroy
  
  delegate :student, to: :training
  delegate :grupo_muscular, :musculo, to: :exercise
  delegate :student_id, to: :student
  
  validates :exercise_id, presence: :true
  
  def to_s
  	exercise	
  end

  def done(date_current)
    exercise_dones.date_equal(date_current).empty?
  end
end
