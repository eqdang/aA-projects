class ArtworkSharesController < ApplicationController
    

    def index

        render json: ArtworkShare.all 
    end

    def create
        
        artwork_share = ArtworkShare.new(artwork_id: params[:artwork_id], viewer_id: params[:viewer_id])
        if artwork_share.save
            render json: artwork_share 
        else
            render json: artwork_share.errors.full_messages, status:422
        end

        # artwork_share_params = params.require(:artwork_share).permit(:artwork_id, :viewer_id)
        # artwork_share = ArtworkShare.new(artwork_share_params)

        # if artwork_share.save!
        #     render json: artwork_share 
        # else
        #     render json: artwork_share.errors.full_messages, status: 422
        # end
    end

    def destroy

        artwork_share = ArtworkShare.find(params[:id])
        artwork_share.destroy
        render json: artwork_share

    end

    # private
    # def artwork_share_params
    #     params.require[:artwork_share].permit[:artwork_id, :viewer_id]
    # end

end

