module Api
  module V1
    class LessonsController < ApiController
      def index
        @lessons = Lesson.all
        @lessons = @lessons.by_group_id(params[:group_id]) if params[:group_id].present?

        render json: { lessons: @lessons }
      end
    end
  end
end
