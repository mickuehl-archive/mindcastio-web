
require 'uri'
require 'mindcast/connection'

class VisitorsController < ApplicationController

  def index
    render layout: "visitors"
  end

  # POST '/search'
  def search
    con = Mindcast::Connection.new(Rails.application.secrets.api_url, {})

    # query the full text index
    result = con.get("/api/1/search?q=#{URI.encode(params[:search][:query])}&size=10", {}, :body => nil)

    # parse the result
    @podcasts = {}
    @podcasts['count'] = result['data']['attributes']['count']
    @podcasts['search_term'] = cleanup_query(result['data']['attributes']['search_term'])
    @podcasts['duration'] = result['data']['attributes']['duration']

    if @podcasts['count'] > 0
      attributes = {}
      result['included'].each do |podcast|
        attributes[podcast['id']] = podcast['attributes']
      end

      podcasts = []
      result['data']['relationships']['results']['data'].each do |data|
        podcasts << attributes[data['id']]
      end

      @podcasts['podcasts'] = podcasts
    else
      @podcasts['podcasts'] = []
    end

  end

private

  def cleanup_query(s)
    s.gsub!('+',' ') if s.include? '+'
    s
  end

end
