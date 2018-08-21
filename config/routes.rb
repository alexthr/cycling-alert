Rails.application.routes.draw do
  get 'fix_reports/new'
  get 'fix_reports/create'
  get 'fix_reports/edit'
  get 'fix_reports/update'
  get 'votes/new'
  get 'votes/create'
  get 'votes/edit'
  get 'votes/update'
  get 'votes/destroy'
  devise_for :users
  root to: "issues#index"
  resources :issues, shallow: true do
    resources :comments
    resources :votes, only: [:new, :create, :edit, :update, :destroy]
    resources :fix_reports, only: [:new, :create, :edit, :update]
  end
  resources :user, only: [:show, :new, :create, :edit, :update, :destroy]
end
