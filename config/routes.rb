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
    resources :assignments do
      member do
        get 'grades', to: 'assignments#grades'
      end
    end
    resources :grades
    resources :advices
  end

  post '/subjects/:subject_id/assignments/:assignment_id/submit', to: 'grades#submit'
  put '/subjects/:subject_id/assignments/:assignment_id/evaluate', to: 'grades#evaluate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
