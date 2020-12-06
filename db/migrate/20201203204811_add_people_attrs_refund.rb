class AddPeopleAttrsRefund < ActiveRecord::Migration[4.2]
    def change
      add_column :people, :payed, :integer
      add_column :people, :refund, :integer 
      add_column :people, :refund_locked, :boolean
      add_column :people, :donation, :integer
      add_column :people, :donation_document_path, :string 
    end
end