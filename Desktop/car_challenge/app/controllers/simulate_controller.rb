class SimulateController < ApplicationController
  def do
    @car = YAML.load(session[:car])
  end

  def turn_lights_on_or_off
    @car = YAML.load(session[:car])
    @car.lights_toggle
    session[:car] = @car.to_yaml
    redirect_to "/simulate/do"
  end

  #must put code in here to toggle lights.
end
