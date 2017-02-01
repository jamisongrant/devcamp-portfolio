Rails.application.routes.draw do

  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout',  sign_up: 'register'}
  
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  
  root to: 'pages#home'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

  get 'portfolio/:id', to: 'portfolios#show', as: 'show_portfolio'
  get 'angular-items', to: 'portfolios#angular'

  resources :blogs do
    member do
    get :toggle_status
      end
    end
   
end