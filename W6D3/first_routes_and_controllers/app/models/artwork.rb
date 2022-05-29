class Artwork < ApplicationRecord
    validates :title, presence:true, uniqueness: {scope: :artist_id, message: 'no duplicate uploads! >:('}
    validates :image_url, presence: true
    
    belongs_to :artist,
        primary_key: :id, 
        foreign_key: :artist_id,
        class_name: :User

    has_many :shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :shares,
        source: :viewer

    has_many :comments,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy

    def self.users_artwork(user_id)
        Artwork
            .left_outer_joins(:shares)
            .where("artworks.artist_id = :user_id OR artwork_shares.viewer_id = :user_id", user_id: user_id)
            .distinct
    end
end
