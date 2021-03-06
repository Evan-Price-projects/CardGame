Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #
  resources :cards, :tables, :users, :sessions
  post 'cards/play_card'
  post 'cards/draw_card'
  post 'cards/reset_card'
  post 'cards/reset_game'
  post 'cards/select_card'
  post 'cards/pass_card'
  post 'cards/recard_card'
  post 'cards/take_from_board'
  post 'cards/leave_game'
  post 'cards/discard_card'
  post 'cards/recover_discard'
  root 'tables#index'
  post 'users/assign_current_user_table'
  post 'cards/discard_cards'
  get 'cards/discard_cards'
  post 'cards/cards_to_discard'
  get 'cards/remove_cards'
  post 'cards/cards_to_remove'
  match '/login', to: 'sessions#new', via: :get
  match '/login_create', to: 'sessions#create', via: :post
  match '/logout', to: 'sessions#destroy', via: :delete

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
