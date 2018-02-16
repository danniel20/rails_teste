class SearchController < ApplicationController

  def contacts
    @contacts = Contact.search(params[:q], params[:page])
    render "contacts/index"
  end

end
