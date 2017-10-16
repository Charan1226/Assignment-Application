Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "flat_bookings#home"
  resources :flat_bookings do
  	post :get_report, on: :collection
  	get :show_data, on: :collection
  end
end
