class SpecialtiesController < ApplicationController
  def autocomplete
    specialties = Specialty.beginning_with(params[:term])
    specialties_information = specialties.map do |specialty|
      { label: specialty.name, value: professionals_path(specialty_id: specialty.id) }
    end
    render json: specialties_information
  end
end
