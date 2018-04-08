Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "top_page#index"

  resources :posts, only: :show

  namespace :admin do
    root "dash_board#index"
    resources :posts, except: :show
  end
end
