class EmailsController < ApplicationController
  set_tab :audience
  before_filter :authenticate_user!, :except => [:create]

  def index
    @stories = current_user.stories 
    render :layout => 'adminfixed'
  end

  def export
    render :text => current_user.emails.collect(&:email).join("\n"),
      :content_type => 'text/plain'
  end

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
