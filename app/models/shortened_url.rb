class ShortenedUrl < ApplicationRecord
validates :short_url, uniqueness: true
#validates :original_url, presence: true
validates :original_url, uniqueness: true
#validates :short_url, presence: true
#before_validation :generate_short_url, on: :create
before_create :generate_short_url
  def generate_short_url
    
    loop do
      short_url = SecureRandom.urlsafe_base64(6)
      self.short_url = short_url
      return @short_url = short_url unless ShortenedUrl.exists?(short_url: short_url)
      byebug
    end
  byebug

  end
end

