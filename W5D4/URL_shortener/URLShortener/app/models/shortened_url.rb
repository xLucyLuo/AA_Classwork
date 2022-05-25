class ShortenedUrl < ApplicationRecord
    validates :long_url, :short_url, :user_id, presence: true

    def self.random_code
        SecureRandom::urlsafe_base64
    end

    def self.create!(user, long_url)
        new_short_url = ShortenedUrl.new(user_id: user.id, long_url: long_url, short_url: ShortenedUrl.random_code + '.com' )
        new_short_url.save!
    end

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
end


