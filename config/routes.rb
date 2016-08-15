Rails.application.routes.draw do
  root "index#index"
  resources :supports
  get '/supports/flop/:support_id' => 'supports#flop', as: :support_flop

end
