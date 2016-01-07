class ApplicationController < ActionController::Base
  # Disable CSRF check
  skip_before_action :verify_authenticity_token

  before_filter :set_response_format

  private

  def set_response_format
    request.format = :json
  end
end
