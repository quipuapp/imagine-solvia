# Purge data
Client.delete_all
Professional.delete_all

# Clients
Client.create! name: 'Albert', surnames: 'Bellonch'

# Professionals
Professional.create! name: 'Juan', surnames: 'Pérez'
