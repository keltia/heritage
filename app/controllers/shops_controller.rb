class ShopsController < ApplicationController
  set_tab :shop
  before_filter :set_title
  layout 'story'

  def show
  end
end
