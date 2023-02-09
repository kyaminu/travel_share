Rails.application.routes.draw do
  #ログインしている時のルートパス
  authenticated :user do
    root to: 'trips#index', as: :user_root
  end
  
  root 'home#top'
  get 'shared_trip', to: 'shared_trips#show'
  
  resources :trips, only: %w[ index new create show destroy share]  do
    member do
      post 'share'
    end
    resources :trip_contents, only: %w[ new create show edit update destroy] 
  end
  
  devise_for :users, controllers: {
    # ↓ローカルに追加されたコントローラーを参照する(コントローラー名: "コントローラーの参照先")
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }
end