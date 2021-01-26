# frozen_string_literal: true

module Users
  class UserTokenController < Knock::AuthTokenController
    
    def create
      response.headers['Authorization'] = 'Bearer ' + auth_token.token
      render json: auth_token, status: :created
    end

    def refresh
      render json: [], status: :ok
    end

  end
end