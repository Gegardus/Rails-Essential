Rails.application.routes.draw do
  root "main#index"

  get 'categories/index'
  get 'categories/show'
  get 'categories/new'
  get 'categories/edit'
  get 'categories/delete'


  match 'about', to: "main#about", via: :get
  match 'hello', to: "main#hello", via: :get


  get 'main/index'

  get 'tasks/index'
  get 'tasks/new'
  get 'tasks/edit'
  get 'tasks/show'
  get 'tasks/delete'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
