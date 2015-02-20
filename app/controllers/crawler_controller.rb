class CrawlerController < ApplicationController

  def crawl
    page = Nokogiri::HTML(open("http://www.terra.com.br/"))
    title = page.css('title').text
    description = page.css('meta')[0]
    description2 = page.css('descriptionadsa2').text

    render plain: title +  "\n" + description +  "\n" + description2
  end
end
