  Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  devise_for :users
  devise_scope :user do
    get '/users/:id' => 'users#show', as: :myprofile
  end
  root to: "issues#index"
  get "/directions" => "directions#show"
  post "/directions" => "directions#new"
  resources :issues, shallow: true do
    resources :comments, only: [:create, :destroy]
    resources :votes, only: [:new, :create, :edit, :update, :destroy]
    resources :fix_reports, only: [:new, :create, :edit, :update]
  end
  namespace :admin do
    resources :issues, only: [ :index, :show ] do
      member  do
        get 'change_status'
      end
    end
  end
end
