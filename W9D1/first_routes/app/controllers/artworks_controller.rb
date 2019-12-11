class ArtworksController < ApplicationController
    
    def index
        
        artwork = Artwork.where(artist_id: params[:user_id])
        artwork_shares = ArtworkShare.where(viewer_id: params[:user_id])
        artwork2 = Artwork.where(id: artwork_shares.first) 

        # artwork = 
        # artwork = Artwork.find(params[:artist_id]= :user_id)
        # artwork_shares = ArtworkShare.find(params[:viewer_id])
        # artwork2 = artwork_shares.artwork_id
        
        # artwork = Artwork.find(params[:user_id])
        # artwork_shares = ArtworkShare.find(params[:user_id])
        
        render json: [artwork, artwork2]


    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def create
        
        artwork = Artwork.new(title: params[:title], image_url: params[:image_url], artist_id: params[:artist_id])
        if artwork.save
            render json: artwork 
        else
            render json: artwork.errors.full_messages, status:422
        end

        # artwork = Artwork.new(params.require(:artwork).permit(:title, :imag_url, :artist_id))
        # if artwork.save!
        #     render json: artwork 
        # else
        #     render json: artwork.errors.full_messages, status: :422
        # end
    end
    
    def update
        artwork = Artwork.find(params[:id])
        artwork.title = params[:title]
        artwork.image_url = params[:image_url]
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status:422
        end
    end

    def destroy

        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: "succesfully deleted"

    end

end
