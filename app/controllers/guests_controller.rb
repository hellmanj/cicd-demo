require 'uri'
require 'net/http'
require 'json'

class GuestsController < ApplicationController
  def list
    baseurl = "https://#{Rails.configuration.backend['host']}:#{Rails.configuration.backend['port']}"
    uri = URI("#{baseurl}/guest-list")
    res = Net::HTTP.get_response(URI(uri))
    if res.is_a?(Net::HTTPSuccess)
      render_list(JSON.parse(res)["guests"])
    else
      render status: res.code
    end
  end

  def list_test
    test_data = %Q|{"guests":[{"first_name": "Barrett", "last_name": "Hardy"},{"first_name": "Justine", "last_name": "Doyle"}]}|
    render_list(JSON.parse(test_data)["guests"])
  end

  def render_list(guests)
    @guests = guests
    render 'list'
  end
end
