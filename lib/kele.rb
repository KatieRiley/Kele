require 'httparty'
require 'json'
class Kele
  include HTTParty

  def initialize(user_name, password)
    response = self.class.post(base_api_endpoint("sessions"), body: {email: username, password: password})
    @auth = response["auth_token"]
  end

  def get_me
    response = self.class.get(bloc_base_api_url, headers: { "authorization" => @auth })
    @current_user = JSON.parse(response.body)
  end
end
