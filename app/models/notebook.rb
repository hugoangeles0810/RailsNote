class Notebook < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  validate :title, presence: true, length: { minimun: 1 }
end
