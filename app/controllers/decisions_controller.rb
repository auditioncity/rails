class DecisionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @decision = current_user.director.decisions.new
    @decision.actor_id = params[:actor_id]
    @decision.notes = params[:notes]
    @decision.callback = params[:callback] == "true" ? true : false
    if @decision.save
      render "show.json.jbuilder", status: :created
    else
      render json: {errors: @decision.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def update
    @decision = Decision.find(params[:id])
    @decision.notes = params[:notes]
    @decision.callback = params[:callback] == "true" ? true : false
    if @decision.save
      render "update.json.jbuilder"
    else
      render json: {errors: @decision.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def show
    @decision = Decision.find(params[:id])
    if @decision
      render "show.json.jbuilder", status: :ok
    else
      render json: {errors: @decision.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def index
    @decision = Decision.find_by_director_id(current_user.director)
    if @decision
      render "index.json.jbuilder"
    else
      render json: {errors: @decision.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def destroy
    if Decision.find(params[:id]).destroy
      render json: {success: "Decision Deleted"}, status: :ok
    else
      render json: {error: "That Decision does not exist."},
             status: :not_found
    end
  end

end