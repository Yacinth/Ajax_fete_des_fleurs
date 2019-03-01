class EmailController < ApplicationController
  before_action :authenticate_user!
  def index
    @emails = Email.all
  end

    def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html{ redirect_to root_path }
      format.js
    end
  end
  
  def edit
    
    @email = Email.find(params[:id])
    puts "O"*70
    respond_to do |format|
    format.html{ redirect_to root_path }
    format.js
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
      end
  end

    private

  def email_params
    params.permit(:object, :body)
  end
end
