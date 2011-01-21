Sc2tvZaklady::Application.routes.draw do

  resources :suggestions

  devise_for :admins
  devise_for :users
  
  resources :posts do
    resources :comments
  end
  
  
  resources :duels do
    member do
      get :result
      put :make_result
    end
    resources :bets
  end

  resources :users do
    resources :bets
  end

  resources :suggestions

  match ':controller(/:action)' 
  match ':controller(/:action(/:id))'
  
  resources :home
 
  resources :admin_panel
  
  
  root :to => "home#index"
  
end
