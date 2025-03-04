Rails.application.routes.draw do
  resources :dishes, only: :show
  resources :chefs, only: [:show, :update] do
    resources :ingredients, only: :index, controller: 'chefs/ingredients'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
