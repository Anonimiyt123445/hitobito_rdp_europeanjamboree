class AddPeopleAttrsRefundSepa < ActiveRecord::Migration[4.2]
    def change
      add_column :people, :refund_sepa, :boolean, default: false 
    end
end