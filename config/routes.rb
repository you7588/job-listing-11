Rails.application.routes.draw do

  resource :user

  namespace :admin do
    resources :users do
      resource :profile, :controller => "user_profiles"
    end
    resources :jobs do
      collection do
        post :bulk_update
      end
      member do
        post :publish
        post :hide
        post :reorder
      end
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :jobs

  resources :resumes
  resources :events
  resources :welcome
  resources :growths
  resources :posts


  root 'posts#index'
  get "/faq" => "pages#faq"
end
