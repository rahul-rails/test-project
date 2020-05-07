Rails.application.routes.draw do
  
  resources :plays
  root to: "image_uploads#new"
  resources :image_uploads, only: [:new, :create, :show] do
  	get :random_image_urls, on: :collection
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
