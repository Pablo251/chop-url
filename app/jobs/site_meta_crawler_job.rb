class SiteMetaCrawlerJob < ApplicationJob
  queue_as :site_scrapper

  # Saves the site title meta-tag fetched based in the URL
  def perform(site)
    response = HTTParty.get(site.full_url) rescue nil
    fetched_document = Nokogiri::HTML(response.try(:body))
    site_title = fetched_document.try(:title) || 'No Title'

    site.update(title: site_title)
  end
end
