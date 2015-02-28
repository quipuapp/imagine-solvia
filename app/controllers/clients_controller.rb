class ClientsController < ApplicationController
  def login
    sleep(0.6)
    redirect_to professionals_path
  end
end
