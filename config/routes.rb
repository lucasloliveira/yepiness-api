Rails.application.routes.draw do

    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        omniauth_callbacks: 'overrides/omniauth_callbacks',
        registrations:      'overrides/registrations'
    }

    root :to => 'application#index'

    scope 'api' do
      scope '/v1' do
        scope '/user' do
          scope '/friends' do
            get   '/' => 'user#friends'
            get   '/count' => 'user#friendsCount'
            post  '/add/:friendId' => 'user#addFriend'
            get   '/sent' => 'user#sentRequests'
            get   '/received' => 'user#receivedRequests'
            post  '/accept/:friendId' => 'user#acceptFriend'
            post  '/decline/:friendId' => 'user#declineFriend'
            delete  '/remove/:friendId' => 'user#removeFriend'
          end
          get   '/:id' => 'user#byId'
        end

        scope '/yep' do
          post '/' => 'yep#create'
          put '/' => 'yep#update'
          put '/:yepId/category/:categoryId' => 'yep#updateCategory'
          put '/:yepId/rating/:rating' => 'yep#updateRating'
          get '/sent' => 'yep#sent'
          get '/received' => 'yep#received'
        end

        scope '/crawler' do
          get '/' => 'crawler#crawl'
        end

        scope '/category' do
          get '/' => 'category#list'
        end
      end
    end
end
