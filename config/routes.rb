Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :campaigns do
    resources :investigators # only [ :edit, :update ]
    resources :scenarios # only [ :edit, :update ]
    resources :campaign_log_entries # only [ :edit, :update ]
  end
end
