Rails.application.routes.draw do

  resources :admins do
  end
  # Back admin routes start
  namespace :admin do
    resources :users
    resources :active_vulnerabilities
    # Admin root
    root to: 'application#index'
  end
  # Back admin routes end

  scope :admin do
    resources :active_vulnerabilities
  end

  # Front routes start
  devise_for :users, only: [:session, :registration], path: 'session',
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  # Application root
  root to: 'application#home'
  # Front routes end
end
