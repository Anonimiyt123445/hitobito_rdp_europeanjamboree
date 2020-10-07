# encoding: utf-8

#  Copyright (c) 2012-2020 << 
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.

module RdpEuropeanjamboree::Person
    extend ActiveSupport::Concern
  
    included do
      Person::PUBLIC_ATTRS << :old_id << 
        :rdp_association << 
        :rdp_association_region << 
        :rdp_association_sub_region << 
        :rdp_association_group << 
        :rdp_association_number << 
        :role << 
        :tour << 
        :sepa_name << 
        :sepa_address << 
        :sepa_zip_code << 
        :sepa_town << 
        :sepa_iban << 
        :registration_pdf_path << 
        :registration_locked << 
        :registration_print_date << 
        :sepa_signature << 
        :sepa_date << 
        :contract_signature << 
        :media_agreement << 
        :registration_accepted_date << 
        :payment_problem << 
        :payment_recieved <<
        :sepa_first <<
        :sepa_second <<
        :sepa_third  <<
        :sepa_comment <<
        :old_phone

        Person::FILTER_ATTRS << :rdp_association << 
        :rdp_association_region << 
        :rdp_association_sub_region << 
        :rdp_association_group << 
        :role << 
        :tour << 
        :registration_locked << 
        :registration_print_date << 
        :sepa_signature << 
        :sepa_date << 
        :contract_signature << 
        :media_agreement << 
        :registration_accepted_date << 
        :payment_problem << 
        :payment_recieved 
    end
    
   def has_role(role)
    if !roles.loaded? then
      Person::PreloadGroups.for([self])
    end

    roles.each do |r|
      if r.type == role.to_s then
        return true
      end
    end
    return false
  end
end