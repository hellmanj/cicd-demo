class GuestsFromDbController < ApplicationController
  def guests_from_db
    @guests = %Q|{"guests":[{"first_name": "Lulu", "last_name": "Turner"},{"first_name": "Jerome", "last_name": "Barlow"}]}|
    render json: @guests
  end
end
