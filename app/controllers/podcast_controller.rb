
require 'uri'
require 'mindcast/connection'

class PodcastController < ApplicationController

  def podcast
    @uid = params['uid']

    # query the podcast details
    con = Mindcast::Connection.new(Rails.application.secrets.api_url, {})

    result = con.get("/api/1/p/#{@uid}", {}, :body => nil)
    @podcast = result['data']['attributes']

  end

  def episode
  end

end
