class EmailsController < ApplicationController
  set_tab :audience
  before_filter :authenticate_user!, :except => [:create]

  def index
    @stories = current_user.stories
    @emails = Email.paginate(:page => params[:page],
                             :per_page => 20).
                             order('created_at DESC').
                             where(:user_id => current_user.id)
    render :layout => 'adminfixed'
  end

  def export
    render :text => current_user.emails.collect(&:email).join("\n"),
      :content_type => 'text/plain'
  end

  def destroy
    @email = current_user.emails.find(params[:id].to_s)
    @email.destroy
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
