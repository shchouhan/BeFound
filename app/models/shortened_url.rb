class ShortenedUrl < ApplicationRecord
validates :short_url, uniqueness: true
validates :original_url, presence: true
validates :original_url, uniqueness: true
before_validation :generate_short_url
  def generate_short_url
    loop do
      self.short_url = SecureRandom.urlsafe_base64(6)

      return true unless ShortenedUrl.exists?(short_url: self.short_url)
    end
  end
end

