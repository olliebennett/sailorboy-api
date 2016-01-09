class StaticPagesController < ApplicationController
  skip_before_action :set_response_format

  def home
  end
end
