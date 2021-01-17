Rails.application.routes.draw do
    devise_for :users, controllers: {
  sessions: 'devise/sessions',
  registrations: 'devise/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: "homes#top"
get "home/about", to: "homes#about"
resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
resources :users, only: [:index, :show, :edit, :update]

end
