class DirectorsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.update(full_name: params[:full_name]) if params[:full_name]
    @director = current_user.directors.new(
        company_name: params[:company_name],
        primary_address: params[:address_type],
        primary_email: params[:email_type],
        primary_phone: params[:phone_type],
        primary_url: params[:website_type]
    )
    @director.addresses.new(address1: params[:address1],
                         address2: params[:address2],
                         city: params[:city],
                         state: params[:state],
                         zip: params[:zip],
                         label: params[:address_type])
    @director.emails.new(label: params[:email_type], info: params[:email])
    @director.phone_numbers.new(label: params[:phone_type], info: params[:phone_number])
    @director.websites.new(label: params[:website_type], info: params[:website_url])
    if @director.save
      render "show.json.jbuilder", status: :created
    else
      render json: {errors: @director.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def update
    @director = Director.find(params[:id])
    @director.user.full_name = params[:full_name]
    @director.company_name = params[:company_name]
    if @director.save
      render "update.json.jbuilder"
    else
      render json: {errors: @director.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def show
    @director = Director.find(params[:id])
    if @director
      render "show.json.jbuilder", status: :ok
    else
      render json: {errors: @director.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def index
    @director = Director.all
    if @director
      render "index.json.jbuilder"
    else
      render json: {errors: @director.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def destroy
    if Director.find(params[:id]).destroy
      render json: {success: "Director Profile Deleted"}, status: :ok
    else
      render json: {error: "That Director Profile does not exist."},
             status: :not_found
    end
  end

end