Sc2tvZaklady::Application.routes.draw do
  
  devise_for :admins

  devise_for :users
      
  resources :duels do
    resources :bets
  end
  
  resources :users do
    resources :bets
  end
    
  match ':controller(/:action)' 
  match ':controller(/:action(/:id))'
  
  resources :admin_panel
  
  

  root :to => "duels#index"
  
end
