Rails.application.routes.draw do
  get 'shared_trips/show'
  root 'home#top'
  
  resources :trips, except: %w[edit update]  do
    member do
      post 'share'
      
    end
    resources :trip_contents, except: %w[index] 
  end
  get 'shared_trip', to: 'shared_trips#show'
  devise_for :users, controllers: {
    # ↓ローカルに追加されたコントローラーを参照する(コントローラー名: "コントローラーの参照先")
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }
end