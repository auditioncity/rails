class UpdateActorsAndAddressesForPrimaries < ActiveRecord::Migration
  def change
    add_column :actors, :primary_address, :string
    add_column :actors, :primary_email, :string
    add_column :actors, :primary_phone, :string
    add_column :actors, :primary_url, :string

    add_column :addresses, :label, :string
  end
end
