Rails.application.routes.draw do
  resource :voter, only: [:new, :create]

  root 'voters#new'
end
