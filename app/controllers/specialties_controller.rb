class SpecialtiesController < ApplicationController
  def autocomplete
    specialties = Specialty.beginning_with(params[:term])
    specialties_information = specialties.map do |specialty|
      { label: specialty.name, value: specialty_professionals_path(specialty) }
    end
    render json: specialties_information
  end
end
