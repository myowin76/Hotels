class ReviewsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params[:review])
    if @review.save
      redirect_to @review, :notice => "Successfully created review."
    else
      render :action => 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
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
