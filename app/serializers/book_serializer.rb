class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :synposis, :author_id
  # belongs_to :author
end
