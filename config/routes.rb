Rails.application.routes.draw do
  root "post_images#index"
  devise_for :users
  resources :post_images, only: [:new, :create, :index, :show] do #post_imagesとpost_commentsは親子関係
    resources :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy] #親のresocesで指定したコントローラに、子のresorcesで指定したコントローラが続く(「ネスト」すると表記
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
