Rails.application.routes.draw do
#Xing::Cms::Engine.routes.draw do
  get "/homepage",       :to => 'pages#show', :url_slug => 'homepage', :as => :homepage
  get 'pages/:url_slug', :to => 'pages#show', :as => :page
  resources :menus, :only => [ :show, :index, :update ]

  namespace :admin do
    resources :froala_images, :only => [:index, :create]
    post "/froala_images/delete", :to => 'froala_images#destroy'
    resources :froala_documents, :only => [:create]
    resources :pages, :param => :url_slug
    resources :menu_items
    resources :content_blocks
  end
end
