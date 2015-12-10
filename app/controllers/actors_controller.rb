class ActorsController < ApplicationController

  before_action :authenticate_user!

  def create
    user = current_user
    #binding.pry
    if params[:info]
      headshot = params[:headshot] unless params[:headshot] == "undefined"
      resume = params[:resume] unless params[:resume] == "undefined"
      @info = JSON.parse(params[:info])
      @info.symbolize_keys!
      user.update(full_name: @info[:full_name]) if @info[:full_name]
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
          primary_address: @info[:address_type],
          primary_email: @info[:email_type],
          primary_phone: @info[:phone_type],
          primary_url: @info[:website_type],
          headshot: headshot,
          resume: resume)
      @actor.addresses.new(address1: @info[:address1],
                           address2: @info[:address2],
                           city: @info[:city],
                           state: @info[:state],
                           zip: @info[:zip],
                           label: @info[:address_type])
      @actor.emails.new(label: @info[:email_type], info: @info[:email])
      @actor.phone_numbers.new(label: @info[:phone_type], info: @info[:phone_number])
      @actor.websites.new(label: @info[:website_type], info: @info[:website_url])
    end

    if @actor.save
      render "show.json.jbuilder", status: :created
    else
      render json: {errors: @actor.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def update
    if params[:info]
      headshot = params[:headshot] unless params[:headshot] == "undefined"
      resume = params[:resume] unless params[:resume] == "undefined"
      @info = JSON.parse(params[:info])
      @info.symbolize_keys!
      @actor = Actor.find(params[:id])
      current_user.update(full_name: @info[:full_name]) if @info[:full_name]
      @actor.bio = @info[:bio]
      @actor.age_young = @info[:age_young]
      @actor.age_old = @info[:age_old]
      @actor.height_feet = @info[:height_feet]
      @actor.height_inches = @info[:height_inches]
      @actor.hair_color = @info[:hair_color]
      @actor.eye_color = @info[:eye_color]
      @actor.skills = @info[:skills]
      @actor.gender = @info[:gender]
      @actor.ethnicity = @info[:ethnicity]
      @actor.talent_agency = @info[:talent_agency]
      @actor.union = @info[:union]
      @actor.headshot = headshot
      @actor.resume = resume
      if @actor.save
        render "update.json.jbuilder", status: :ok
      else
        render json: {errors: @actor.errors.full_messages},
               status: :unprocessable_entity
      end
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

  def add_address
    actor = Actor.find(params[:actor_id])
    actor.addresses.new(address1: params[:address1],
                        address2: params[:address2],
                        city: params[:city],
                        state: params[:state],
                        zip: params[:zip],
                        label: params[:address_type])
    if actor.save
      @address = actor.addresses.last
      render "address.json.jbuilder", status: :created
    else
      render json: {errors: actor.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def update_address
    @address = Address.where(addressable_type: 'Actor',
                             addressable_id: params[:actor_id],
                             label: params[:old_type]).take
    @address.address1 = params[:address1] if params[:address1]
    @address.address2 = params[:address2] if params[:address2]
    @address.city = params[:city] if params[:city]
    @address.state = params[:state] if params[:state]
    @address.zip = params[:zip] if params[:zip]
    @address.label = params[:label] if params[:type]
    if @address.save
      render "address.json.jbuilder", status: :ok
    else
      render json: {errors: @address.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def delete_address
    address = Address.where(addressable_type: 'Actor',
                            addressable_id: params[:actor_id],
                            label: params[:type]).take
    if address.destroy
      render json: {success: "Mailing Address Deleted"}
    else
      render json: {error: "That Mailing Address does not exist."},
             status: :not_found
    end
  end

  def add_email
    actor = Actor.find(params[:actor_id])
    actor.emails.new(label: params[:email_type], info: params[:email])
    if actor.save
      @email = actor.emails.last
      render "email.json.jbuilder", status: :created
    else
      render json: {errors: actor.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def update_email
    @email = Email.where(contactable_type: 'Actor',
                         contactable_id: params[:actor_id],
                         label: params[:old_type]).take
    @email.label = params[:type] if params[:type]
    @email.info = params[:email] if params[:email]
    if @email.save
      render "email.json.jbuilder", status: :ok
    else
      render json: {errors: @email.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def delete_email
    email = Email.where(contactable_type: 'Actor',
                        contactable_id: params[:actor_id],
                        label: params[:type]).take
    if email.destroy
      render json: {success: "Email Deleted"}
    else
      render json: {error: "That Email does not exist."},
             status: :not_found
    end
  end

  def add_phone
    actor = Actor.find(params[:actor_id])
    actor.phone_numbers.new(label: params[:phone_type], info: params[:phone_number])
    if actor.save
      @phone = actor.phone_numbers.last
      render "phone.json.jbuilder", status: :created
    else
      render json: {errors: actor.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def update_phone
    @phone = PhoneNumber.where(contactable_type: 'Actor',
                               contactable_id: params[:actor_id],
                               label: params[:old_type]).take
    @phone.label = params[:type] if params[:type]
    @phone.info = params[:phone] if params[:phone]
    if @phone.save
      render "phone.json.jbuilder", status: :ok
    else
      render json: {errors: @phone.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def delete_phone
    phone = PhoneNumber.where(contactable_type: 'Actor',
                              contactable_id: params[:actor_id],
                              label: params[:type]).take
    if phone.destroy
      render json: {success: "Phone Number Deleted"}
    else
      render json: {error: "That Phone Number does not exist."},
             status: :not_found
    end
  end

  def add_url
    actor = Actor.find(params[:actor_id])
    actor.websites.new(label: params[:website_type], info: params[:website_url])
    if actor.save
      @url = actor.websites.last
      render "website.json.jbuilder", status: :created
    else
      render json: {errors: actor.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def update_url
    @url = Website.where(contactable_type: 'Actor',
                         contactable_id: params[:actor_id],
                         label: params[:type]).take
    @url.label = params[:type] if params[:type]
    @url.info = params[:website_url] if params[:website_url]
    if @url.save
      render "website.json.jbuilder", status: :ok
    else
      render json: {errors: @url.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def delete_url
    url = Website.where(contactable_type: 'Actor',
                        contactable_id: params[:actor_id],
                        label: params[:type]).take
    if url.destroy
      render json: {success: "Website URL Deleted"}
    else
      render json: {error: "That Website URL does not exist."},
             status: :not_found
    end
  end
end