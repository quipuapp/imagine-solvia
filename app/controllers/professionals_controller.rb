class ProfessionalsController < ApplicationController
  def index
    @professionals = if @specialty = Specialty.find_by_id(params[:specialty_id])
                       @term = @specialty.name
                       @specialty.professionals
                     else
                       Professional.all
                     end

    if @sort_type = params[:sort_type]
      @professionals = @professionals.sort_by_rating if @sort_type == 'rating'
      @professionals = @professionals.sort_by_distance if @sort_type == 'distance'
      @professionals = @professionals.sort_by_best_price if @sort_type == 'best_price'
      @professionals = @professionals.sort_by_response_time if @sort_type == 'response_time'
    end
  end

  def show
    @professional = Professional.find(params[:id])
  end
end
