Rails.application.routes.draw do
  get 'mypages/show'
  devise_for :users
  root "home#top"
  get "/mypage", to: "mypages#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
