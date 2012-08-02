class Page < ActiveRecord::Base  
  validates :title, :presence => true
  validates :content, :presence => true

  scope :unpublished, lambda { where("pages.published_on is NULL or pages.published_on > ? ",Time.now) }
  scope :published, lambda { where("pages.published_on is not Null or pages.published_on <= ? ",Time.now) }

  def total_words
    title.strip.split(/\s+/).size +  content.strip.split(/\s+/).size

  end
end
