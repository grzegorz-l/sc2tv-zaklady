Sc2tvZaklady::Application.routes.draw do
  
  devise_for :users
  
  resources :users do
      resources :bets
    end
    
  resources :duels do
    resources :bets
  end

  root :to => "duels#index"
  
end
