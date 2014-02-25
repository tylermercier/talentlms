require "talentlms/version"
require "talentlms/client"
require "talentlms/api_error"

module TalentLMS
  extend self

  def init(options={})
    @@client = Client.new(options)
  end

  def method_missing(method, *args, &block)
    response = @@client.send(method, *args, &block)
    raise ApiError.new(response) if error_response?(response)
    response
  end

  def error_response?(response)
    response.is_a?(Hash) && response.key?("error")
  end
end
