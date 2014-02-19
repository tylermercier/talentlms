require "talentlms/version"
require "talentlms/client"

module TalentLMS
  extend self

  def init(options={})
    @@client = TalentLMS::Client.new(options)
  end

  def method_missing(method, *args, &block)
    @@client.send(method, *args, &block)
  end
end
