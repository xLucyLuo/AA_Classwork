# == Schema Information
#
# Table name: playlist_tracks
#
#  id          :bigint           not null, primary key
#  playlist_id :integer          not null
#  song_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PlaylistTrack < ApplicationRecord
    belongs_to :song,
        primary_key: :id,
        foreign_key: :song_id,
        class_name: :Song
    
    belongs_to :playlist,
        primary_key: :id,
        foreign_key: :playlist_id,
        class_name: :Playlist
end
