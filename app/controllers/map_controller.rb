# encoding: utf-8

require 'rest-client'

class MapController < ApplicationController
  layout 'application'

  skip_authorization_check
  def index
    @access = true or (current_user.has_role_type(Group::Admins::Admin) ||
            current_user.has_role_type(Group::Admins::Finance) ||
            current_user.has_role_type(Group::Kontingentsleitung::Member) ||
            current_user.has_role_type(Group::Admins::Registration))

    if not @access
      flash[:alert] = "Du hast nicht die Rolle um diese Informationen zu sehen"
      return
    end

    # people = Person.where("(rdp_role='Teilnehmer'
    # AND (rdp_status_registration_approved=true
    # OR (rdp_registration_arrival_date BETWEEN '2017-01-01' AND '2018-09-01' AND rdp_association='bdp'AND rdp_status_registration_approved=false)
    # OR (rdp_registration_arrival_date BETWEEN '2017-01-01' AND '2018-02-23' AND rdp_association='dpsg'AND rdp_status_registration_approved=false)
    # OR (rdp_registration_arrival_date BETWEEN '2017-01-01' AND '2018-03-07' AND rdp_association='vcp'AND rdp_status_registration_approved=false)
    # ))")
    people = Person.where("registration_locked=true")

                            # OR (rdp_registration_arrival_date BETWEEN '2017-01-01' AND '2018-09-01' AND rdp_association='bdp'AND rdp_status_registration_approved=false)
                            # OR (rdp_registration_arrival_date BETWEEN '2017-01-01' AND '2018-03-15' AND rdp_association='dpsg'AND rdp_status_registration_approved=false)
                            # OR (rdp_registration_arrival_date BETWEEN '2017-01-01' AND '2018-03-15' AND rdp_association='vcp'AND rdp_status_registration_approved=false)
                            
    @users = []
    @groups = Group.all.order('name ASC')
    people.each do |p|
      if p.address.present? && (p.zip_code.present? || p.town.present?)
        id = p.id
        name = p.full_name
        address = p.address + " " + p.zip_code + " " + p.town
        role = p.role
        if p.contract_signature.nil?
            status = false
        else 
            status = p.contract_signature
        end 
        if p.unit_old.nil?
            unit_old = "no old unit"
        else 
            unit_old = p.unit_old #Group.where("id=" + p.primary_group_id.to_s)
        end
        if p.unit_planned.nil?
            unit_planned = "no planned unit"
        else
            unit_planned = p.unit_planned #Group.where("id=" + p.primary_group_id.to_s)
        end
        link = '<a href="http://localhost:3000/groups/' + p.primary_group_id.to_s + '/people/' + p.id.to_s + '">' + p.full_name.to_s + '</a>'
        package = p.tour.to_s
        association = p.rdp_association + " - " + p.rdp_association_group

        if (p.latitude.present? && p.longtitude.present?)
          latitude = p.latitude
          longitude = p.longtitude
        else
          address = I18n.transliterate(address.gsub(" ","+"))
          rest_response =  ActiveSupport::JSON.decode(RestClient.get('https://maps.googleapis.com/maps/api/geocode/json?address='+ address +'&key=AIzaSyAPS-uHgTIug9RlK_wBotqn_hrMTkQeUVM'))

          if rest_response["status"] == "OK"
            latitude = rest_response["results"][0]["geometry"]["location"]["lat"].to_s
            longitude = rest_response["results"][0]["geometry"]["location"]["lng"].to_s
            Rails.logger.debug("== Set Geo to: " + latitude + " - " + longitude)
            p.latitude = latitude
            p.longtitude = longitude
            p.save
          else
            latitude = "53.963" + rand(100..999).to_s
            longitude = "7.576" + rand(100..999).to_s
          end

          Rails.logger.debug("== Rest Response: " + rest_response.to_s)

        end
        @users.push([id, name, address, role, status, unit_old, unit_planned, link, latitude, longitude, package, association])
      end
    end
  end

end
