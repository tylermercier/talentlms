class ApiError < Exception
  attr_accessor :message

  def initialize(response)
    @type = response["error"]["type"]
    @message = response["error"]["message"]
  end
end
