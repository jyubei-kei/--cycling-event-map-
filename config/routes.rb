Rails.application.routes.draw do
  devise_for :users
  root "home#top"
  get "/mypage", to: "mypages#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :admin do
    get 'events/index'
    get 'events/show'
    get 'events/new'
    get 'events/edit'
    root "dashboard#index"

    resources :events do
      resources :aid_stations
    end
  end
end
