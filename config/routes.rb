Rails.application.routes.draw do

  devise_for :users,
             path: 'auth',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout'
             },
             controllers: {
               sessions: 'auth/sessions'
             }
  resources :users
  resources :subjects do
    resources :assignments
    resources :grades
    resources :advices
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
