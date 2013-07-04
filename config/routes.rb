Letterclick::Application.routes.draw do
  resources :games, only: [:index, :create, :show] do
    resources :states, controller: 'game_states', only: [:index, :create]
    resources :moves, only: [:index, :create]
  end
end
