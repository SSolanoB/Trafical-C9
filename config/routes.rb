Rails.application.routes.draw do
  get 'track_resets/new'
  get 'track_resets/edit'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
  get 'users/sign_out', to: 'users/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  resources :calories
  get '/track', to: 'calories#track'
  resources :track_resets, only: [:new, :create, :edit, :update]
end
