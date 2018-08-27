Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  devise_for :users
  devise_scope :user do
    get '/users/:id' => 'users#show', as: :myprofile
  end
  root to: "issues#index"
  resources :issues, shallow: true do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
    resources :votes, only: [:new, :create, :edit, :update, :destroy]
    resources :fix_reports, only: [:new, :create, :edit, :update]
  end

end
