# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.

require 'iban-tools'

class Person::PrintController < ApplicationController
  before_action :authorize_action


  def index 
    @group ||= Group.find(params[:group_id])
    @person ||= group.people.find(params[:id])
    @printable = self.printable 
    if not self.printable
      flash[:alert] = (I18n.t 'errors.print') + ": " + self.get_not_printable_reason
    end 
  end

  def preview
    if self.printable
      pdf = RdpEuropeanjamboree::Export::Pdf::Registration.render(@person,true)

      send_data pdf, type: :pdf, disposition: 'inline', filename: "Anmeldung-EJ-Vorschau.pdf"
    end
  end


  def submit
    if self.printable
      pdf = RdpEuropeanjamboree::Export::Pdf::Registration.render(@person,false)

      send_data pdf, type: :pdf, disposition: 'inline', filename: person.id.to_s + "-Anmeldung-EJ-" + Date.today.to_s + ".pdf"
    end
  end

  def get_not_printable_reason
    reason = ""
    @person.first_name.length < 2 ? reason += "\n - " + (I18n.t 'activerecord.attributes.person.first_name') : "" 
    @person.last_name.length < 2 ? reason += "\n - " + (I18n.t 'activerecord.attributes.person.last_name') : "" 
    @person.address.length < 2 ? reason += "\n - " + (I18n.t 'activerecord.attributes.person.adress') : "" 
    @person.zip_code.length < 2 ? reason += "\n - " + (I18n.t 'activerecord.attributes.person.zip_code') : "" 
    @person.town.length < 2 ? reason += "\n - " + (I18n.t 'activerecord.attributes.town.last_name') : "" 
    (not IBANTools::IBAN.valid?(@person.sepa_iban)) ? reason += "\n - " + (I18n.t 'activerecord.attributes.person.sepa_iban') : "" 
    
    return reason
  end 

  def printable
    self.get_not_printable_reason.length < 1  
  end

  private

  def entry
    @person ||= Person.find(params[:id])
  end

  def authorize_action
    authorize!(:edit, entry)
  end



end
