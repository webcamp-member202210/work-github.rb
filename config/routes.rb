Rails.application.routes.draw do

  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items
    resources :customers, only: [:show, :edit, :update, :index]
    resources :orders, only: [:show, :update, :index]
  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    get "customers/unsubscribe"
    resources :items, only: [:index, :show]
    resources :homes, only: [:top, :about]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    root to: "homes#top"
    get "homes/about"
    get "customers" => "customers#show", as:"customer"
    patch "customers" => "customers#update", as:"update_customer"
    get "customers/edit/current" => "customers#edit", as:"edit_customer"
    patch "customers/withdrawal"
    delete "cart_items/destroy_all"
    post "orders/confirm"
    get "orders/thanks"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
