Rails.application.routes.draw do
  resources :questions
  resources :advertisements
  resources :topics do
    resources :posts, except: [:index]
  end

  get 'about' => 'welcome#about'

  get 'contact' => 'welcome#contact'

  get 'faq' => 'welcome#faq'

  root 'topics#index'

 end
