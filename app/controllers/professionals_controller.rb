class ProfessionalsController < ApplicationController
  def index
    @professionals = if @specialty = Specialty.find_by_id(params[:specialty_id])
                       @term = @specialty.name
                       @specialty.professionals
                     else
                       Professional.all
                     end

    @sort_types = %w{ rating response_time distance best_price }

    @sort_type = params[:sort_type]
    unless @sort_types.include?(@sort_type)
      @sort_type = 'rating'
    end

    @professionals = @professionals.sort_by_rating if @sort_type == 'rating'
    @professionals = @professionals.sort_by_distance if @sort_type == 'distance'
    @professionals = @professionals.sort_by_best_price if @sort_type == 'best_price'
    @professionals = @professionals.sort_by_response_time if @sort_type == 'response_time'
  end

  def show
    @professional = Professional.find(params[:id])
  end
end
