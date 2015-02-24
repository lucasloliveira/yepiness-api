class CrawlerController < ApplicationController

  require 'open-uri'

  def crawl
    page = Nokogiri::HTML(open(params[:url]))

    title = page.css("meta[property='og:title']")
    description = page.css("meta[property='og:description']")
    image = page.css("meta[property='og:image']")

    crawlResults = {
        title: title[0]['content'],
        description: description[0]['content'],
        image: image[0]['content']
    }

    render json: crawlResults
  end
end
