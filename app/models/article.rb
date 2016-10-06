class Article < ActiveRecord::Base

  # add SEO friendly titles to url
  def to_param
    "#{id} #{title}".parameterize
  end
  
  validates :title, presence: true, length: { minimum: 3 }
  validates :body, presence: true
end
