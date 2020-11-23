class DashboardController < ApplicationController
  def show
    @patients = Patient.all
  end
end
