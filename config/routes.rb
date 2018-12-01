Rails.application.routes.draw do
  get 'dashboard/home'

  get 'dashboard/categories'

  get 'dashboard/products'

  get 'dashboard/users'

  get 'dashboard/reviews'

  get 'dashboard/orders'

  get'ajax_calls/check_email_taken'

  get'ajax_calls/find_sub_categories'

  devise_for :users
  root "products#index"
  get 'home/index'
  get 'home/about'
  get 'home/contact'

  resources :categories
  resources :products
  resources :cart_line_items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
