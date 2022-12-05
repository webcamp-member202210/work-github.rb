Rails.application.routes.draw do

  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    patch "order_details/:id" => "order_details#update", as:"order_details_update"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items
    resources :customers, only: [:show, :edit, :update, :index]
    resources :orders, only: [:show, :update, :index]
  end



  scope module: :public do
    delete "cart_items/destroy_all"
    get "orders/thanks"
    get "customers/unsubscribe"
    post "orders/confirm/view" => "orders#confirm", as:"orders_confirm"
    resources :items, only: [:index, :show]
    resources :homes, only: [:top, :about]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :orders, only: [:new, :create, :index, :show, :destroy]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    root to: "homes#top"
    get "homes/about"
    get "customers/show" => "customers#show", as:"customer_show"
    patch "customers" => "customers#update", as:"update_customer"
    get "customers/edit/current" => "customers#edit", as:"edit_customer"
    patch "customers/withdrawal"

    
  end

    devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
