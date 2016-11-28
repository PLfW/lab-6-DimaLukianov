class Subject < ApplicationRecord
  belongs_to :institution
  has_many :lessons
end
