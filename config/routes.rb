Rails.application.routes.draw do

  scope '/api' do

    mount_devise_token_auth_for 'User', at: '/auth'

    # scope '/v1' do
    #   scope '/user' do
    #
    #   end
    #
    #   scope '/crawl' do
    #     get '/:url' => 'crawler#crawl'
    #   end
    # end
  end
end
