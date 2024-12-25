Rails.application.routes.draw do

    #管理者アカウント
    devise_for :admins, controllers: {
      registrations: 'admins/registrations',
      sessions: 'admins/sessions'
    }

    resources :admins, only: [:show]

    root to: 'tops#index' #トップページ
    get 'freelance' => 'tops#freelance'
   #get 'recruit' => 'tops#recruit'

    get 'python' => 'tops#python'
    get 'recruit' => 'tops#recruit'
    get 'ai' => 'tops#ai'

    resources :works do
      resources :progresses
      member do
        get :apply
        post :send_mail
        get :confirm_point
        post :apply
      end
    end

    resources :contracts do
      resources :comments, only: [:create, :edit, :update, :destroy], param: :id
      member do
        post :send_mail
        get "info"
        get "conclusion"
      end
    end

    resources :columns do
      collection do 
        post :import
      end
    end

    #get '*path', controller: 'application', action: 'render_404'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
