class ClientsController < ApplicationController
  def login
    sleep(0.6)
    redirect_to specialties_path
  end
end
