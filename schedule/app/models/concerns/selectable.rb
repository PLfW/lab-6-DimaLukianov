module Selectable
  extend ActiveSupport::Concern

  class_methods do
    def for_select
      all.map { |i| [i.name, i.id] }
    end
  end
end
