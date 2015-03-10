class CrawlerController < ApplicationController

  require 'scrapifier'

  def crawl
    yepContent = params[:yepContent]
    puts yepContent
    scrapResult = yepContent.scrapify(which: 0, images: [:png, :jpeg, :jpg])
    p scrapResult

    render json: scrapResult
  end
end
