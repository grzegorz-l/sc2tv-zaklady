Sc2tvZaklady::Application.routes.draw do
  
  resources :duels do
    resources :bets
  end

  root :to => "duels#index"
  
end
