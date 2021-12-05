Rails.application.routes.draw do
  resources :my_pokemons, path: 'my-pokemons'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
