class ProfessionalsController < ApplicationController
  def index
    if @specialty = Specialty.find_by_id(params[:specialty_id])
      @professionals = @specialty.professionals
      @term = @specialty.name
    end
  end
end
