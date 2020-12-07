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
    @group ||= Group.find(params[:group_id])
    @person ||= group.people.find(params[:id])
    if @person.registration_locked
      send_data File.read( generate_file_path + @person.registration_pdf_path), type: :pdf, disposition: 'inline', filename: @person.registration_pdf_path, title: @person.registration_pdf_path
    elsif  self.printable
      pdf = RdpEuropeanjamboree::Export::Pdf::Registration.render(@person,true)
      send_data pdf, type: :pdf, disposition: 'inline', filename: "Anmeldung-EJ-Vorschau.pdf"
    end
  end


  def donation
    @group ||= Group.find(params[:group_id])
    @person ||= group.people.find(params[:id])
    if @person.refund_locked and self.printable
      pdf = RdpEuropeanjamboree::Export::Pdf::Donation.render(@person,true)
      send_data pdf, type: :pdf, disposition: 'inline', filename: "Beantragung-EJ-Spendenbescheinigung.pdf"
    end
  end


  def submit
    @group ||= Group.find(params[:group_id])
    @person ||= group.people.find(params[:id])
    
    if @person.registration_locked
      flash[:notice] = (I18n.t 'info.print')
      return
    end

    if self.printable
      pdf = RdpEuropeanjamboree::Export::Pdf::Registration.new_pdf(@person,false)
      filename = Time.now.strftime("%Y-%m-%d--%H-%M-%S--") + @person.id.to_s + "-" + @person.last_name + "-" + @person.first_name + "-Registration.pdf"
      full_path =  generate_file_path + filename
      dir = File.dirname(full_path)
      FileUtils.mkdir_p(dir) unless File.directory?(dir)
      pdf.render_file(full_path)

      @person.registration_locked = true 
      @person.registration_print_date = Time.now
      @person.sepa_date = Time.now  
      @person.registration_pdf_path = filename
      @person.save 

      send_data File.read(full_path), type: :pdf, disposition: 'inline', filename: filename
    end
  end

  def get_not_printable_reason
    reason = ""
    @person.first_name.present? ? "" : reason += "\n - " + (I18n.t 'activerecord.attributes.person.first_name') 
    @person.last_name.present? ? "" : reason += "\n - " + (I18n.t 'activerecord.attributes.person.last_name') 
    @person.address.present? ? "" : reason += "\n - " + (I18n.t 'activerecord.attributes.person.address') 
    @person.zip_code.present? ? "" : reason += "\n - " + (I18n.t 'activerecord.attributes.person.zip_code') 
    @person.town.present? ? "" : reason += "\n - " + (I18n.t 'activerecord.attributes.person.town')  
    @person.birthday.present? ? "" : reason += "\n - " + (I18n.t 'activerecord.attributes.person.birthday')  
    @person.role.present? ? "" : reason += "\n - " + (I18n.t 'activerecord.attributes.person.role') 
    @person.email.present? ? "" : reason += "\n - " + (I18n.t 'activerecord.attributes.person.email') 
    @person.rdp_association_region.present? ? "" : reason += "\n - " + (I18n.t 'activerecord.attributes.person.rdp_association_region') 
    @person.rdp_association_sub_region.present? ? "" : reason += "\n - " + (I18n.t 'activerecord.attributes.person.rdp_association_sub_region') 
    @person.rdp_association_group.present? ? "" : reason += "\n - " + (I18n.t 'activerecord.attributes.person.rdp_association_group') 
    @person.rdp_association_number.present? ? "" : reason += "\n - " + (I18n.t 'activerecord.attributes.person.rdp_association_number') 
    @person.sepa_name.present? ? "" : reason += "\n - " + (I18n.t 'activerecord.attributes.person.sepa_name') 
    IBANTools::IBAN.valid?(@person.sepa_iban) ? "" : reason += "\n - " + (I18n.t 'activerecord.attributes.person.sepa_iban')
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

  def generate_file_path
    return "#{Rails.root}/private/uploads/person/registration/" + @person.id.to_s + "/"
  end



end
