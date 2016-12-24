xml.instruct! :xml, :version => "1.0"
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc root_url
    xml.changefreq("hourly")
    xml.priority "1.0"
  end
  @articles.each do |article|
    xml.url do
      xml.loc article_url(article)
      xml.lastmod article.updated_at.to_date
      xml.changefreq "monthly"
      xml.priority "0.5"
    end
  end
end
