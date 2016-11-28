class Lesson < ApplicationRecord
  enum day: %i( monday tuesday wednesday thursday friday saturday sunday )
  enum lesson_type: %i( lecture laboratory practical )
  belongs_to :user
  belongs_to :subject
  belongs_to :group

  scope :by_group_id, -> (group_id) { where(group_id: group_id) }

  scope :schedule, -> () { order(:day, :lesson_number, :subgroup).group_by(&:day) }

  def self.search(search_params)
    results = all
    results = results.by_group_id(search_params[:group_id]) if search_params[:group_id]
    results.schedule
  end
end
