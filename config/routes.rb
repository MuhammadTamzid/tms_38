Rails.application.routes.draw do
  scope "(:locale)", :locale => /en|vn/ do
    root                'static_pages#home'
    get    'help'    => 'static_pages#help'
    get    'about'   => 'static_pages#about'
    get    'contact' => 'static_pages#contact'
    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'

    namespace :supervisor do
      root 'static_pages#home'
      resources :users
    end

    resources :users
  end
end
