Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root 'posts#index'
    resources :posts, only: [:show, :index]
    resources :tags, only: [:show]
    resources :categories, only: [:show]

    namespace :admin do
      resources :posts, except: [:show, :index]
      resources :categories, except: [:show]
    end
  end
end
