Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  resources 'orders'

  resources 'batches'

  resources 'purchase_channel'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
