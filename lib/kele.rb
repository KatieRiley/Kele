require 'httparty'
class Kele
  include HTTParty
  attr_accessor :user_name, :password, :bloc_base_api_url, :user_authentication_token

  def initialize(user_name, password)
    @user_name = user_name
    @password = password
    auth = {email: user_name, password: password}
    @bloc_base_api_url = 'https://www.bloc.io/api/v1'
    @user_authentication_token = self.class.post('https://www.bloc.io/api/v1/sessions', auth)
  end
end
