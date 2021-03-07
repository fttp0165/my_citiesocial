Rails.application.routes.draw do
  namespace :admin do
    get 'products/index'
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products,only:[:index,:show]
  resources :categories,only:[:show]
  resource :cart
  namespace :admin do
    root 'products#index'
    resources :products,except:[:show]
    resources :vendors,except:[:show]
   
    resources :categories,except:[:show] do
      collection  do
        put :sort #PUT /admin/categories/sort
      end
    end
  end

  namespace :api do
    namespace :v1 do
      post 'subscribe',to: 'utils#subscribe'
      post 'cart',to: 'utils#cart'
    end
  end
end
