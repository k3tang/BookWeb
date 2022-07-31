class Book < ApplicationRecord
    validates :ISBN, :title, :author, :pages, :f_date, :review_title, :user_id presence: true

    belongs_to :user, dependent: :destroy
   
end
