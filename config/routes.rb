Rails.application.routes.draw do

    mount_devise_token_auth_for 'User', at: 'auth'
    # , controllers: {
    #     token_validations:  'overrides/token_validations'
    # }

    scope 'api' do
      scope '/v1' do
        scope '/user' do
          get '/friends' => 'user#friends'
          get '/:id' => 'user#byId'
          post '/addFriend/:friendId' => 'user#addFriend'
          get '/friends/count' => 'user#friendsCount'
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
