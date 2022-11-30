class BookNoAuthSerializer < ActiveModel::Serializer
  attributes :id, :title, :synposis

  belongs_to :author
end
