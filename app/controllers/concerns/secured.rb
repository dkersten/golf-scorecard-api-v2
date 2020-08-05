require 'net/http'
require 'uri'

class JsonWebToken
    def self.verify(token)
      JWT.decode(token, nil,
                 true, # Verify the signature of this token
                 algorithms: 'RS256',
                 iss: 'https://ezgolfscore.us.auth0.com/',
                 verify_iss: true,
                 aud: Rails.application.secrets.auth0_api_audience,
                 verify_aud: true) do |header|
        jwks_hash[header['kid']]
      end
    end
  
    def self.jwks_hash
      jwks_raw = Net::HTTP.get URI("https://ezgolfscore.us.auth0.com/.well-known/jwks.json")
      jwks_keys = Array(JSON.parse(jwks_raw)['keys'])
      Hash[
        jwks_keys
        .map do |k|
          [
            k['kid'],
            OpenSSL::X509::Certificate.new(
              Base64.decode64(k['x5c'].first)
            ).public_key
          ]
        end
      ]
    end
  end

module Secured
    extend ActiveSupport::Concern
  
    included do
      before_action :authenticate_request!, :user_id
    end
  
    private
  
    def authenticate_request!
      auth_token
    rescue JWT::VerificationError, JWT::DecodeError
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end
  
    def user_id
        user = User.find_by(auth0ID: auth_token[0]["email"])

        if user 
            user.id
        else
            user = User.create(auth0ID: auth_token[0]["email"])
            user.id
        end
    end

    def http_token
      if request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ').last
      end
    end
  
    def auth_token
      JsonWebToken.verify(http_token)
    end
  end