Rails.application.routes.draw do
  root 'main#index'
  get  'reflect'  => 'main#reflect'
  get  'redirect' => 'main#redirect'
  post 'post'     => 'main#post'
end
