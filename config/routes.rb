Rails.application.routes.draw do

  resources :posts, only: %i[ create new ] do
    resources :comments, only: %i[ create new ] do 
      post 'likes', to: 'likes#create_comments_like'
      delete 'likes', to: 'likes#destroy_comments_like'
    end   
    resources :likes, only: :create do 
      collection do 
        delete :destroy
      end
    end
  end

  devise_for :users
  root "site#index"
end
