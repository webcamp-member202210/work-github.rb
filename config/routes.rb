Rails.application.routes.draw do

  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items
    resources :customers, only: [:show, :edit, :update, :index]
    resources :orders, only: [:show, :update]
  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    resources :items, only: [:index, :show]
    resources :homes, only: [:top, :about]
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
    resources :customers, only: [:show, :edit, :update]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    root to: "homes#top"
    get "homes/about"
    get "customers/unsubscribe"
    patch "customers/withdrawal"
    delete "cart_items/destroy_all"
    post "orders/confirm"
    get "orders/thanks"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
