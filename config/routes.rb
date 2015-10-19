Rails.application.routes.draw do
  get 'question/resources'

  resources :posts
  resources :question

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end