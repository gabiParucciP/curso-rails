Rails.application.routes.draw do
  resource :auths, only: [ :create ]
  resources :kinds
    # scope module: "v1" do
    # resources :contacts, constraints: lambda { |request| request.params[:version] == "1" } do
    # parameter: { name: "version", value: "1" }
    # header: { name: "Accept", value: "application/vnd.api+json; version=2" }
    # header: { name: "X-Version", value: "2.0" }
    api_version(module: "v1", path: { value: "v1" }) do
      resources :contacts do
        resource :kind, only: [ :show ]
        resource :kind, only: [ :show ], path: "relationships/kind"

        resource :phones, only: [ :show ]
        resource :phones, only: [ :show ], path: "relationships/phones"

        resource :phone, only: [ :update, :create, :destroy ]
        resource :phone, only: [ :update, :create, :destroy ], path: "relationships/phone"

        resource :address, only: [ :show, :update, :create, :destroy ]
        resource :address, only: [ :show, :update, :create, :destroy ], path: "relationships/address"
    end
  end

  # scope module: "v2" do
  # resources :contacts, constraints: lambda { |request| request.params[:version] == "2" } do
  # parameter: { name: "version", value: "2" }
  # header: { name: "Accept", value: "application/vnd.api+json; version=2" }
  # header: { name: "X-Version", value: "2.0" }
  api_version(module: "v2", path: { value: "v2" }) do
    resources :contacts do
      resource :kind, only: [ :show ]
      resource :kind, only: [ :show ], path: "relationships/kind"

      resource :phones, only: [ :show ]
      resource :phones, only: [ :show ], path: "relationships/phones"

      resource :phone, only: [ :update, :create, :destroy ]
      resource :phone, only: [ :update, :create, :destroy ], path: "relationships/phone"

      resource :address, only: [ :show, :update, :create, :destroy ]
      resource :address, only: [ :show, :update, :create, :destroy ], path: "relationships/address"
  end
end



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
