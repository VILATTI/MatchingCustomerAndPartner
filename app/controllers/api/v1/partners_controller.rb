module Api
  module V1
    class PartnersController < ApiController
      def match
        render json: MatchPartners.call(params[:address], params[:floor_material])
      end
    end
  end
end
