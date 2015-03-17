Rails.application.routes.draw do

    mount_devise_token_auth_for 'User', at: 'auth'
    # , controllers: {
    #     token_validations:  'overrides/token_validations'
    # }

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
          get '/sent' => 'yep#sent'
          get '/received' => 'yep#received'
        end

        scope '/crawler' do
          get '/' => 'crawler#crawl'
        end
      end
    end
end
