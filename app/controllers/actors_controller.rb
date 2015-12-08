class ActorsController < ApplicationController

  before_action :authenticate_user!

  def create
    user = current_user
    #binding.pry
    if params[:info]
      @info = JSON.parse(params[:info])
      @info.symbolize_keys!
      @actor = user.actors.new(
          bio: @info[:bio],
          age_young: @info[:age_young],
          age_old: @info[:age_old],
          height_feet: @info[:height_feet],
          height_inches: @info[:height_inches],
          hair_color: @info[:hair_color],
          eye_color: @info[:eye_color],
          skills: @info[:skills],
          gender: @info[:gender],
          ethnicity: @info[:ethnicity],
          talent_agency: @info[:talent_agency],
          union: @info[:union],
          headshot: params[:headshot],
          resume: params[:resume])
      @actor.addresses.new(address1: @info[:address1],
                           address2: @info[:address2],
                           city: @info[:city],
                           state: @info[:state],
                           zip: @info[:zip])
      @actor.emails.new(label: @info[:email_type], info: @info[:email])
      @actor.phone_numbers.new( label: @info[:phone_type], info: @info[:phone_number])
      @actor.websites.new( label: @info[:website_type], info: @info[:website_url])
    end

    if @actor.save
      render "show.json.jbuilder", status: :created
    else
      render json: {errors: @actor.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    @actor = Actor.find(params[:id])
    @actor.update(bio: params[:bio],
                  age_young: params[:age_young],
                  age_old: params[:age_old],
                  height_feet: params[:height_feet],
                  height_inches: params[:height_inches],
                  hair_color: params[:hair_color],
                  eye_color: params[:eye_color],
                  skills: params[:skills],
                  gender: params[:gender],
                  ethnicity: params[:ethnicity],
                  talent_agency: params[:talent_agency],
                  union: params[:union])
    if @actor.save
      render "update.json.jbuilder", status: :ok
    else
      render json: { errors: @actor.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show
    @actor = Actor.find(params[:id])
    if @actor
      render "show.json.jbuilder", status: :ok
    else
      render json: {errors: @actor.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def index
    @actor = Actor.all
    if @actor
      render "index.json.jbuilder"
    else
      render json: {errors: @actor.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def destroy
    if Actor.find(params[:id]).destroy
      render json: {success: "Actor Profile Deleted"}, status: :ok
    else
      render json: {error: "That Actor Profile does not exist."},
             status: :not_found
    end
  end

  #private
  # def info_params
  #   params.require(:info).permit({info:
  #       [:bio, :age_young, :age_old, :height_feet, :height_inches,
  #        :hair_color, :eye_color, :skills, :gender, :ethnicity,
  #        :talent_agency, :union, :address1, :address2, :city,
  #        :state, :zip, :email, :phone_number, :website_url,
  #        :email_type, :phone_type, :website_type]}, :headshot, :resume)
  # end
end