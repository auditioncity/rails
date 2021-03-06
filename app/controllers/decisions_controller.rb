class DecisionsController < ApplicationController
  before_action :authenticate_user!

  def create
    #@decision = current_user.director.decisions.new
    #@decision.actor_id = params[:actor_id]
    @decision = Decision.find_or_initialize_by(director_id: current_user.director.id,
                                               actor_id: params[:actor_id])
    @decision.notes = params[:notes]
    @decision.callback = params[:callback] == "true" || params[:callback] == true ? true : false
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
    @decision.callback = params[:callback] == "true" || params[:callback] == true ? true : false
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
    @decision = find_decisions
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

  private

  def find_decisions
    decisions = Decision.where(director_id: current_user.director)
    decisions = decisions.where(callback: true) if params[:callback]
    decisions = decisions.where("notes LIKE ?", "%#{params[:notes]}%") if params[:notes]
    decisions
  end

  def decision_exists?
    #decisions = Decision.where(director_id: current_user.director)
    #decisions = decisions.where(actor_id: params[:actor_id])
    Decision.exists?(director_id: current_user.director.id, actor_id: params[:actor_id])
  end

end