class CrawlerController < ApplicationController

  require 'scrapifier'

  def crawl
    yepContent = params[:url]
    scrapResult = yepContent.scrapify(which: 0)

    render json: scrapResult
  end
end
