Sc2tvZaklady::Application.routes.draw do
  
<<<<<<< HEAD
  devise_for :admins

  devise_for :users
      
  resources :duels do
    resources :bets
  end
=======
  devise_for :users
>>>>>>> f1ed896c65919abd0878f6063e33466881653861
  
  resources :users do
    resources :bets
  end
    
  match ':controller(/:action)' 
  match ':controller(/:action(/:id))'
  
  resources :admin_panel
  
  

  root :to => "duels#index"
  
end
