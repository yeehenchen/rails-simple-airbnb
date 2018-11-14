Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flats do
    collection do
      get 'search', to: 'flats#search'
    end
  end

  root 'flats#index'
end
