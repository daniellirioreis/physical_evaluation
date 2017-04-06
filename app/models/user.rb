class User < ActiveRecord::Base
  belongs_to :student
  belongs_to :evaluator
  belongs_to :coach
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :timeoutable

  def to_s
  	 student if student.present?
  end
  
  def student?
    student.present?
  end
  
  def evaluator?
    evaluator.present?
  end

  def coach?
    coach.present?
  end
  
end
