class CrawlerController < ApplicationController

  require 'scrapifier'

  def crawl
    yepContent = params[:yepContent]
    puts yepContent
    scrapResult = yepContent.scrapify(which: 0)
    p scrapResult

    render json: scrapResult
  end
end
