class Book < ApplicationRecord
    validates :author, presence: true
    validates :title, presence: true
    validates :synposis, presence: true

    belongs_to :author
    def self.search_by_author(author)
        self.where.not("author like ?", "%#{author}%" )
        # self.find_by(author: "#{author}")
        # self.find(author)
    end
end
