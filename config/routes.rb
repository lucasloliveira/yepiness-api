Rails.application.routes.draw do

    mount_devise_token_auth_for 'User', at: 'auth'

    scope 'api' do
      scope '/v1' do
        scope '/user' do
          get '/friends/count' => 'user#friendCount'
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
