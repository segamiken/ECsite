Rails.application.routes.draw do

#管理者ログイン
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

#ユーザーログイン
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

#トップ画面
	root 'products#index'

#ユーザー側
	resources :customers, only:[:show, :edit, :update] do
		collection do
			get :withdrawal
			post '/delete' => 'customers#delete'
			get :orderd
		end
	end

	resources :client_addresses, only:[:new, :create, :edit, :update, :destroy]
	resources :carts, only:[:index, :create, :edit, :update, :destroy]
	resources :products, only:[:show]

	resources :contacts, only:[:new, :create] do
		collection do
			post :confirm
			get :complete
		end
	end


#管理者側
	namespace :admin do
		resources :customers, only:[:index, :show, :edit, :update] do
		collection do
			post '/delete' => 'customers#delete'
		end
		end
	end


	namespace :admin do
		resources :products, only:[:index, :show, :new, :create, :show, :edit, :update, :destroy]
	end

	namespace :admin do
		resources :genres, only:[:new, :create]
	end
end
