Rails.application.routes.draw do
  root 'sessions#new'

  resources :sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :invoices do
    resources :invoice_items
    resources :payment_schedules, except: %i[index show destroy]
  end
end
