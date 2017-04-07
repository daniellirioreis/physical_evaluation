Rails.application.routes.draw do
  
  resources :companies
  resources :coaches do 
    get :autocomplete_coach_name, :on => :collection  	
  end

  get 'exercise_trainings/show'

  resources :trainings
  
  resources :evaluations do 
  	get :send_email,  :on => :member
  	get :search, :on => :collection
  	get :print, :on => :member
  end

  resources :evaluators do
		get :autocomplete_evaluator_name, :on => :collection   		
   end
  
  devise_for :users
  
  resources :students do 
  	get :autocomplete_student_name, :on => :collection
  	get :evolution, :on => :member
  end
  
  resources :exercises
  resources :exercise_trainings
  
  root "dashboard#index"
end
