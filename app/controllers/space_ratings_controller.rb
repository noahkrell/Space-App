class SpaceRatingsController < ApplicationController

  include SessionsHelper

  def new
  end

  def update
    @rating = SpaceRating.find(params[:id])
    @comment = @rating.review
    if @rating.update_attributes(stars: params[:stars])
      respond_to do |format|
        format.js
      end
    end
  end

  def create
    @space = Space.find(params[:space_ratings][:space_id].to_i)
    @booking = Booking.where(space_id: @space.id, renter_id: current_user.id).last
    space_rating_hash = {}
    space_rating_hash[:comment] = space_rating_params[:comment]
    space_rating_hash[:score] = params[:score].to_f if params[:score].to_f > 0
    space_rating_hash[:booking_id] = @booking.id
    @review = SpaceRating.new(space_rating_hash)
    if @review.save && request.xhr?
      render :partial => "reviews", :layout => false, :locals => { rating: @review}, :formats => [:html]
    elsif @review.save
      flash[:success] = "Thanks for your review!"
      redirect_to "/spaces/#{@space.id}"
    else
      redirect '/posts'
    end
  end

  private
  def space_rating_params
    params.require(:space_ratings).permit(:comment, :score, :booking_id)
  end
end
