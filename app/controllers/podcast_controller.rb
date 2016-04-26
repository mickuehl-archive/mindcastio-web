
require 'uri'
require 'mindcast/connection'
require 'mindcast/jsonapi'

class PodcastController < ApplicationController

  def podcast
    @uid = params['uid']

    # query the podcast details
    con = Mindcast::Connection.new(Rails.application.secrets.api_url, {})
    result = con.get("/api/1/p/#{@uid}?e=a", {}, :body => nil)

    @podcast = extract_data(result, 'episodes')

  end

  def episode
  end

end
