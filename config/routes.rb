Rails.application.routes.draw do

    #管理者アカウント
    devise_for :admins, controllers: {
      registrations: 'admins/registrations',
      sessions: 'admins/sessions'
    }

    resources :admins, only: [:show]

    root to: 'tops#index' #トップページ

    resources :estimates do
      resource :comments
      collection do
        post :confirm
        post :thanks
      end
      member do
        get :apply
        post :send_mail
        get :confirm_point
        post :apply
      end
    end

    resources :works do
      collection do
        post :confirm
        post :thanks
      end
      member do
        get :apply
        post :send_mail
        get :confirm_point
        post :apply
      end
    end
    

    resources :columns do
      collection do 
        post :import
      end
    end
    resources :entries

    resources :companies do 
      collection do 
        post :import
        post :update_import
      end
      resources :introductions #概要
      resources :larges #上場
      resources :branches #支店
      resources :histories #沿革
      resources :presidents #代表歴
      resources :businesses #事業内容
      resources :executives #役員一覧
      resources :cultures #社風
      resources :recruits #求人
      resources :awards #表彰
      resources :achivements #実績
      resources :reviews #レビュー
      resources :deaths #ブラック
      resources :pressreleases #プレスリリース
      resources :prospects #未来図
      resources :totals #まとめ
    end

    get 'freelance' => 'tops#freelance'
    get 'recruit' => 'tops#recruit'

    get 'python' => 'tops#python'
    get 'ai' => 'tops#ai'

    #get '*path', controller: 'application', action: 'render_404'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
