# require File.expand_path('lib/instagram')

# CALLBACK_URL = "http://localhost:4567/oauth/callback"

# puts Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
# response = Instagram.get_access_token("code", :redirect_uri => CALLBACK_URL)
# puts response

# puts Instagram::OAuth.methods
# puts Instagram.methods
# puts '**************diff*************'
# puts {}.extend(Instagram::OAuth).methods - Instagram.methods

# class MethodTest
#     # Delegate to Instagram::Client
#     def self.method_missing(method, *args, &block)
#       binding.pry
#     end
# end

# MethodTest.nomethod



# module Instagram
#   module Configuration
#     VALID_OPTIONS_KEYS = [:client_id]

#     DEFAULT_CLIENT_ID = nil

#     attr_accessor *VALID_OPTIONS_KEYS

#     def options
#       VALID_OPTIONS_KEYS.inject({}) do |option, key|
#         option.merge!(key => send(key))
#       end
#     end

#     def configure
#       yield self
#     end
#   end

#   extend Configuration

#   module Request

#     def make_request
#       client_id
#     end
#   end

#   class Client
#     include Request

#     attr_accessor *Configuration::VALID_OPTIONS_KEYS

#     def initialize(options={})
#       options = Instagram.options.merge(options)
#       Configuration::VALID_OPTIONS_KEYS.each do |key|
#         send("#{key}=", options[key])
#       end
#     end

#     def req
#       make_request
#     end
#   end
# end

# Instagram.configure do |config|
#   config.client_id = "yogesh"
# end

# puts Instagram::Client.new.req



# module A
#   attr_accessor :api_key

#   def test
#     puts "test"
#   end
# end

# module B
#   extend A
# end

# B.api_key




module Instagram
  class << self
    attr_accessor :client_id

    def options
      {:client_id => send(:client_id)}
    end

    def configure
      yield self
    end
  end

  module Request

    def make_request
      client_id
    end
  end

  class Client
    include Request

    attr_accessor :client_id

    def initialize(options={})
      options = Instagram.options
      key = :client_id
      send("#{key}=", options[key])
    end

    def req
      make_request
    end
  end
end

Instagram.configure do |config|
  config.client_id = "yogesh"
end

puts Instagram::Client.new.req


