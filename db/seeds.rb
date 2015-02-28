# Purge data
Specialty.delete_all
Client.delete_all
Professional.delete_all

# Specialties
%w{ Plumber Painter }.each do |specialty_name|
  Specialty.create! name: specialty_name
end

# Clients
Client.create! name: 'Albert', surnames: 'Bellonch'

# Professionals
Professional.create! name: 'Juan', surnames: 'Pérez'
