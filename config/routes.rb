Rails.application.routes.draw do
  devise_for :users,
             controller: {
               registrations: 'registrations',
               sessions: 'sessions'
             }
  root 'site#index'
end
