class ActorsController < ApplicationController

  before_action :authenticate_user!

  def create
    user = current_user
    @actor = user.actors.new(bio: params[:bio],
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
      render "create", status: :created
    else
      render json: {errors: @actor.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    #todo
  end

  def show
    #todo
  end

  def list
    #todo
  end

  def delete
    #todo
  end
end