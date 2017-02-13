module Roadmap
  def get_roadmap(roadmap_id)
    response = self.class.get(base_api_endpoint("roadmap/#{roadmap_id}"), headers: {"authorization" => @auth})
    @roadmap = JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get(base_api_endpoint("checkpoints/#{checkpoint_id}"), headers: {"authorization" => @auth})
    @checkpoint = JSON parse(response.body)
  end
end
