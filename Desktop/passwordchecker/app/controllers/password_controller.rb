class PasswordController < ApplicationController
  def check
    if params[:userid].nil? || params[:password].nil?
      #need to hold the cookie in the input box after it clears the checks
      cookies[:userid] = params[:userid]
      @userid = cookies[:userid].to_s
      @password = params[:password].to_s
      @userid_validations = "enter user id"
      @password_validations = "enter password"

    else
      @userid = params[:userid]
      @password = params[:password]
      userid_validations
      password_validations
    end
    # if @userid.length >= 6 && @password.length >= 6
    #   @validations = "Your credentials are valid"
    # end


  end

  def userid_validations
    if @userid.length < 6
      @userid_validations = "User id has to be at least 6 characters."
    elsif @userid.include?("!") || @userid.include?("$") || @userid.include?("#")
      @userid_validations = "User ID cannot contain !, $ or # symbols."
    else
      @userid_validations = "Your user id is valid."
    end
  end

  def password_validations
    if @password.length < 6
      @password_validations = "Password has to be at least 6 characters."
    elsif !@password.include?("!") && !@password.include?("$") && !@password.include?("#")
      @password_validations = "Password must contain at least !, $ or # symbols."
    elsif @password.upcase == @password.downcase
      @password_validations = "Your password must contain at least one letter"
    else
      @password_validations = "Your password is valid."
    end
  end
end
