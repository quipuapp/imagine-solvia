class ProfessionalsController < ApplicationController
  def index
    @professionals = if @specialty = Specialty.find_by_id(params[:specialty_id])
                       @term = @specialty.name
                       @specialty.professionals
                     else
                       Professional.all
                     end
  end

  def show
    @professional = Professional.find(params[:id])
  end
end
