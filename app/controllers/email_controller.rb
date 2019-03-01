class EmailController < ApplicationController
  before_action :authenticate_user!
  def index
    @emails = Email.all
  end
end
