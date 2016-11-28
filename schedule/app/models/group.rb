class Group < ApplicationRecord
  include Selectable
  belongs_to :institution
  has_many :lessons
  has_many :users
  validates :name, :institution_id, presence: true
end
