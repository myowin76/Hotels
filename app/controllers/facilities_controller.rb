class FacilitiesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @facilities = Facility.all
  end

  def show
    @facility = Facility.find(params[:id])
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(params[:facility])
    if @facility.save
      redirect_to @facility, :notice => "Successfully created facility."
    else
      render :action => 'new'
    end
  end

  def edit
    @facility = Facility.find(params[:id])
  end

  def update
    @facility = Facility.find(params[:id])
    if @facility.update_attributes(params[:facility])
      redirect_to @facility, :notice  => "Successfully updated facility."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy
    redirect_to facilities_url, :notice => "Successfully destroyed facility."
  end
end
