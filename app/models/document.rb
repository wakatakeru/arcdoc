class Document < ApplicationRecord
  belongs_to :tag
  belongs_to :user
  validates :title, :presence => true
end
