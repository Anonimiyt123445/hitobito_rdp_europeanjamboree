class AddPeopleAttrsMap < ActiveRecord::Migration[4.2]
    def change
      add_column :people, :latitude, :string
      add_column :people, :longtitude, :string
      add_column :people, :unit_old, :string 
      add_column :people, :unit_planned, :string
    end
end