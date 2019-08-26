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

#管理者側

end
