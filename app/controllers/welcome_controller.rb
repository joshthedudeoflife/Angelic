class WelcomeController < ApplicationController
  before_action :redirect_if_signed_in
  def index
  end

private

  def redirect_if_signed_in
 		redirect_to companies_index_path if user_signed_in?
  end
end
