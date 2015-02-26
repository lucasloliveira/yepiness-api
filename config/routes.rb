Rails.application.routes.draw do

    mount_devise_token_auth_for 'User', at: 'auth'

    scope 'api' do
      scope '/v1' do
        scope '/user' do
          get '/friends/count' => 'user#friendCount'
          post '/yep' => 'user#createYep'
        end

        scope '/crawl' do
          get '/' => 'crawler#crawl'
        end
      end
    end
end
