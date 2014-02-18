require 'http'
require 'json'
require 'base64'

module TalentLMS
  class Client
    def initialize(config = {})
      raise ArgumentError.new('Missing API key') unless config.has_key?(:api_key)
      @auth_header = auth_header(config[:api_key])

      raise ArgumentError.new('Missing Sub Domain') unless config.has_key?(:sub_domain)
      @sub_domain = config[:sub_domain]

      @version = 'v1' || config[:version]
    end

    def auth_header(username)
      key = Base64.strict_encode64("#{username}:")
      { 'Authorization' => "Basic #{key}" }
    end

    def route_for_method(method, options=nil)
      url = "https://#{@sub_domain}.talentlms.com/api/#{@version}/#{method}"
      return url if options.nil?
      arguments = options.map {|k,v| "#{k}:#{v}"}.join(',')
      "#{url}/#{arguments}"
    end

    def method_missing(sym, *args, &block)
      url = route_for_method(sym.to_s, *args)
      response = HTTP.with(@auth_header).get(url)
      JSON.parse(response)
    end
  end
end
