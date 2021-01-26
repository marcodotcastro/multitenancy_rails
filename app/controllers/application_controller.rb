class ApplicationController < ActionController::Base
  before_action :set_author

  private

  def set_author
    @author = Author.find_by!(slug: request.subdomain)
  end
end
