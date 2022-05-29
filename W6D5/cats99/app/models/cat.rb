# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "action_view"

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    AVAILABLE_COLORS = ["black", "white", "orange", "coffee"]
    validates :color, inclusion: {in: AVAILABLE_COLORS}
    validates :sex, inclusion: {in: ["M", "F"]}
    validates :birth_date, :color, :name, :sex, :description, presence: true 

    def age 
        time_ago_in_words(self.birth_date)
    end

    def self.AVAILABLE_COLORS
        return AVAILABLE_COLORS
    end
end
