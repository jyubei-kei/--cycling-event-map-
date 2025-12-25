Rails.application.routes.draw do
  devise_for :users
  root "home#top"
  get "/mypage", to: "public/mypages#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #参加者用
  scope module: :public do
    resources :events, only: [:index, :show] do
      post :join, on: :member
    end
    resource :mypage, only: [:show]
  end

  # Defines the root path route ("/")
  # root "articles#index"

  #管理者用
  namespace :admin do
    root "dashboard#index"

    resources :events do
      resources :aid_stations
      resources :courses
    end
  end
end
