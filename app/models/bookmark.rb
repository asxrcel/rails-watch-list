class Bookmark < ApplicationRecord
  has_one_attached :photo
  belongs_to :list
  belongs_to :movie
  validates :comment, length: {minimum: 6}
  validates :movie_id, uniqueness: {scope: :list_id}
end
