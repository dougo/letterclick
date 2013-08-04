Letterclick::Application.routes.draw do
  root to: 'welcome#index'
  resources :games, only: [:index], defaults: { format: 'html' }

  scope 'api/v:api_version', :defaults => { :format => 'json' } do
    resources :games, only: [:index, :create, :show] do
      resources :states, controller: 'game_states', only: [:index]
      resource :state, controller: 'game_states', only: [:show]
      resources :moves, only: [:index, :create]
    end
  end
end
