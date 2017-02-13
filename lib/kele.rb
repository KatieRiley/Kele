require 'httparty'
require 'json'
class Kele
  include HTTParty

  def initialize(user_name, password)
    response = self.class.post(base_api_endpoint("sessions"), body: {email: username, password: password})
    @auth = response["auth_token"]
  end

  def get_me
    response = self.class.get(api_url('users/me'), headers: { "authorization" => @auth })
    @current_user = JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get(api_url("mentors/#{mentor_id}/student_avalability"), headers: { "authorization" => @auth})
    @mentort_availability = JSON.parse(response.body).to_a
  end
end
