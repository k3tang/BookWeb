class SearchesController < ApplicationController

    require 'google_api'

    def search_google_engine
        @response = GoogleApi.new(params[:search]).query 
    end 
end
