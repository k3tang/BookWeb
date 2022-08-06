class Book < ApplicationRecord
    validates :ISBN, :title, :authors, :pages, :f_date, :review_title, :user_id, :categories, :image_links, presence: true

    belongs_to :user, dependent: :destroy

    def blank_stars 
        5 - rating.to_i
    end 
   
end
