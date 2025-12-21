Rails.application.routes.draw do
  devise_for :users
  root "home#top"
  get "/mypage", to: "mypages#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #参加者用
  scope module: :public do
    resources :events, only: %i[index show]
  end

  # Defines the root path route ("/")
  # root "articles#index"

  #管理者用
  namespace :admin do
    root "dashboard#index"

    resources :events do
      resources :aid_stations
    end
  end
end
