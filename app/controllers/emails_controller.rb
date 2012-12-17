class EmailsController < ApplicationController
  def create
    @email = Email.new(params[:email])
    @email.user = @current_photographer || current_user

    respond_to do |format|
      if @email.save
        format.js
      else
        format.js
      end
    end
  end
end
