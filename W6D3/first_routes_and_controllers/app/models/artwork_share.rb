class ArtworkShare < ApplicationRecord
    validates :artwork_id, uniqueness: {scope: :viewer_id, message: "This user has already seen this!"}

    belongs_to :artwork,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Artwork

    belongs_to :viewer,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :User
end
