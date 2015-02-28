class ProfessionalsController < ApplicationController
  def index
    @specialty = Specialty.find(params[:specialty_id])
    @professionals = @specialty.professionals
  end
end
