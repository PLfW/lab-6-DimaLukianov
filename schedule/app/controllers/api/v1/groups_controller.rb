module Api
  module V1
    class GroupsController < ApiController
      def index
        @groups = Group.all
        @groups = @groups.where(institution_id: params[:institution_id]) if params[:institution_id].present?

        render json: { groups: @groups }
      end
    end
  end
end
