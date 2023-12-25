Rails.application.routes.draw do
  # ... other routes ...

  # Devise Token Auth routes
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    sessions: 'auth/sessions',
    registrations: 'auth/registrations'
  }

  # Devise routes
  devise_for :users, skip: [:sessions, :registrations]
  as :user do
    get 'users/sign_in', to: 'devise/sessions#new', as: :new_user_session_devise
    post 'users/sign_in', to: 'devise/sessions#create', as: :user_session_devise
    delete 'users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session_devise
    get 'users/sign_up', to: 'devise/registrations#new', as: :new_user_registration_devise
    post 'users', to: 'devise/registrations#create', as: :user_registration_devise
  end

  # ... other routes ...
end
