class Coach < ActiveRecord::Base
  has_one :user	
	validates :name, :email, presence: true
	validates :name, :email, :cpf, uniqueness: true
	
	after_save :create_user
	
	def to_s
	 name
	end	
	
	private
	
	def create_user
		 user = User.find_by_email_and_coach_id(email, id)		 
     unless user.present?
       user = User.find_by_email(email)  		 

       if user.present? 
         errors.add(:email, "já em está em uso")          
        else
          if self.user.nil?
            user = User.new(email: email, password: 12345678, password_confirmation: 12345678, coach_id: id)
            if user.save
            else
            end            
          else
            self.user.update_attributes(email: email)                  
          end    
        end 
     end 
	end
	
end
