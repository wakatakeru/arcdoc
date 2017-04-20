class Tag < ApplicationRecord
  has_many :documents, :dependent => :destroy
  validates :name, :uniqueness => true, :presence => true
end
