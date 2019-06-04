Rails.application.routes.draw do
  root 'commits#index'

  resources :commits do
    collection do
     delete 'destroy_multiple'
   end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
