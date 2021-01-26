class ApplicationController < ActionController::Base
  include Knock::Authenticable
  skip_before_action :verify_authenticity_token, raise: false

  before_action :set_author

  rescue_from Exception do |e|
    render json: { error: e.message }, status: 422
  end

  private

  def set_author
    @author = Author.find_by!(slug: request.subdomain)
  end

  def current_user
    @current_user ||= User.find payload["user_id"]
  end
end
