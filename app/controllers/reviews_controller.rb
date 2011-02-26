class ReviewsController < ApplicationController
  before_filter :authenticate_user!
  def index
#    @reviews = Review.all
      @hotel = Hotel.find(params[:hotel_id])
      @reviews = @hotel.reviews.all
  end

  def show
    @hotel = Hotel.find(params[:hotel_id])
    @review = Review.find(params[:id])
  end

  def new
#    @review = Review.new
      @hotel = Hotel.find(params[:hotel_id])
      @review = @hotel.reviews.new
  end

  def create
#    @review = Review.new(params[:review])
    @hotel = Hotel.find(params[:hotel_id])
    @review = @hotel.reviews.build(params[:review])
    if @review.save
      redirect_to hotel_path(@hotel), :notice => "Successfully created review."
    else
      render :action => 'new'
    end
  end

  def edit
    @hotel = Hotel.find(params[:hotel_id])    
    @review = Review.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:hotel_id])    
    @review = Review.find(params[:id])
    if @review.update_attributes(params[:review])
      redirect_to @review, :notice  => "Successfully updated review."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_url, :notice => "Successfully destroyed review."
  end
end
