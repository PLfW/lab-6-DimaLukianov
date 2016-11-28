module Api
  module V1
    class InstitutionsController < ApiController
      def index
        @institutions = Institution.all

        render json: { institutions: @institutions }
      end
    end
  end
end
