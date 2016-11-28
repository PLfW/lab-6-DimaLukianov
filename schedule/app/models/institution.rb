class Institution < ApplicationRecord
  include Selectable
  has_many :groups
  has_many :subjects
  validates :name, presence: true
end
