# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.

require 'iban-tools'

class Person::PaymentController < ApplicationController
    before_action :authorize_action

    decorates :group, :person

    def index 
        Rails.logger.debug("===== Index")

        @group ||= Group.find(params[:group_id])
        @person ||= group.people.find(params[:id])

        if (request.put?)
            @person.sepa_name = params["person"]["sepa_name"]
            @person.sepa_address = params["person"]["sepa_address"]
            @person.sepa_zip_code = params["person"]["sepa_zip_code"]
            @person.sepa_town = params["person"]["sepa_town"]
            @person.sepa_iban = params["person"]["sepa_iban"]

            @person.donation = params["person"]["donation"]
            if @person.donation < 0 
                @person.donation = @person.donation * -1 
            end 

            @person.donation_document_path  = params["person"]["donation_document_path"]
            
            @person.save

            if not check_iban(@person.sepa_iban) 
                flash[:alert] = (I18n.t 'errors.iban')
            end
        end 

        @check_iban = check_iban(@person.sepa_iban) 

        if @person.payed.nil?
            @person.payed = 0
        end
        if @person.refund.nil?
            @person.refund = 0
        end 
        if @person.donation.nil?
            @person.donation = 0
        end 

    end

    def donation 
        @person ||= group.people.find(params[:id])
    end 

    def edit 
        @person ||= group.people.find(params[:id])
        if @person.payed.nil?
            @person.payed = 0
        end
        if @person.refund.nil?
            @person.refund = 0
        end 
        if @person.donation.nil?
            @person.donation = 0
        end 
    end

    private
    def entry
        @person ||= group.people.find(params[:id])
    end

    def group
        @group ||= Group.find(params[:group_id])
    end

    def authorize_action
        authorize!(:edit, entry)
    end

    def check_iban(sepa_iban)
        return IBANTools::IBAN.valid?(sepa_iban)
    end

end
  