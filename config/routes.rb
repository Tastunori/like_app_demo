Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get 'users/index' => "users#index"
 get "login" => "users#login_form"
 post "login" => "users#login"
 get "sigun_up"  => "users#sigun_up"
 get "users/index" => "users#index"
 post "users/create" => "users#create"
 post "logout" => "users#logout"
 get "users/:id" => "users#show"
 get "users/:id/edit" =>"users#edit"
 post "users/:id/update" =>"users#update"

 get "posts/:id" => "posts#new"
 post "posts/:id/create" => "posts#create"
 

end
