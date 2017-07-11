Rails.application.routes.draw do

  devise_for :users
  get 'game/button'

  get 'game/board'
  root 'home#helloworld'


  mount Hyperloop::Engine => '/hyperloop'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
