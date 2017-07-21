Rails.application.routes.draw do

  get 'main/app'

  get 'welcome/highscore'

  #devise_for :users
  get 'game/button'

  get 'game/board'
  root 'home#welcomepage'


  mount Hyperloop::Engine => '/hyperloop'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
