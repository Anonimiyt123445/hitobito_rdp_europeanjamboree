# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.

module RdpEuropeanjamboree
  module Export::Pdf
    module Donation
      class Runner
        def render(person, pdf_preview)
      	   return new_pdf(person, pdf_preview).render
        end

        def new_pdf(person, pdf_preview)
          pdf = Prawn::Document.new(page_size: 'A4',
                                    page_layout: :portrait,
                                    margin: 2.cm,
                                    bottom_margin: 1.cm)

          # sections.each { |section| section.new(pdf, person).render }
          
          #define header & footer variables
          imagePath = "../hitobito_rdp_europeanjamboree/app/assets/images/"

          pdf.y = 850
          #pdf.page_count = 0
          pdf.repeat :all do
            #define header
            logo =   Rails.root.join(imagePath + "ej-logo.png")
            pdf.bounding_box [350,750], :width => pdf.bounds.width, :height => 375 do
              pdf.image logo, :width => 150
              # pdf.move_up 15
            end
            
            footer =   Rails.root.join(imagePath + "ej-footer.png")
            pdf.bounding_box [150,370], :width => pdf.bounds.width, :height => 604 do
              pdf.image footer, :width => 496
            end

            polen =   Rails.root.join(imagePath + "ej-polen.png")
            pdf.bounding_box [0,pdf.bounds.bottom + 80], :width => pdf.bounds.width, :height => 275 do
              pdf.image polen, :width => 120
            end

            rdp =   Rails.root.join(imagePath + "rdp.png")
            pdf.bounding_box [350,pdf.bounds.bottom + 80], :width => pdf.bounds.width, :height => 275 do
              pdf.image rdp, :width => 120
            end
            
            pdf.bounding_box [135, pdf.bounds.bottom + 80], :width => pdf.bounds.width do
              pdf.text "Ring deutscher", :size => 8
              pdf.text "Pfadfinderinnen- und", :size => 8
              pdf.text "Pfadfinderverbände e.V.", :size => 8
              pdf.text "Chausseestraße 128/129", :size => 8
              pdf.text "10115 Berlin", :size => 8
            end

            pdf.bounding_box [235, pdf.bounds.bottom + 80], :width => pdf.bounds.width do
              pdf.text "info@europeanjamboree.de", :size => 8
              pdf.text "www.europeanjamboree.de", :size => 8
              pdf.text "Kontingentsleitung:", :size => 8
              pdf.text "Simone Voit", :size => 8
              pdf.text "Günther Bäte", :size => 8
              pdf.text "Thomas Kramer", :size => 8
            end

            pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 10], :width => pdf.bounds.width do
              pdf.text person.id.to_s + " - " + person.full_name, :size => 8
            end
          end

          pdf.number_pages "S. <page> von <total>",
            :at => [pdf.bounds.right - 55, pdf.bounds.bottom + 10 ], :size => 8

          
          pdf.bounding_box([0.mm,220.mm], :width => 85.mm, :heigth => 45.mm) do
            pdf.font_size(6) do
              pdf.text person.first_name +
                        " " + person.last_name +
                        ", " + person.address +
                        ", " + person.zip_code +
                        " " + person.town
            end

            pdf.font_size(10) do
              pdf.text " "
              pdf.text "Ring deutscher Pfadfinder*innenverbände e.V."
              pdf.text "c/o BdP Bundesamt"
              pdf.text "Kesselhaken 23"
              pdf.text "34376 Immenhausen"
            end

          end
          
          
          pdf.move_down 2.cm
          pdf.text "Anforderung Spendenbescheinigung - " + person.full_name + " - " + person.id.to_s , :size => 14
          pdf.move_down 1.cm
          pdf.text "Durch die Absage des European Jamboree durch den rdp e.V. als Reiseveranstalter steht mir entsprechend der Bestimmungen des Pauschalreiserechts eine Rückerstattung der geleisteten Anzahlungen abzüglich der bereits erbrachten Leistungen zu."
          pdf.move_down 3.mm
          pdf.text "Ich bestätige, dass ich anspruchsberechtigt für die Rückerstattung des Teilnehmerbeitrags des/der Teilnehmer*in " + person.full_name + " bin und erkläre hiermit, auf die Auszahlung eines Teilbetrags von " + person.donation.to_s +  "€ zu verzichten und diesen stattdessen dem Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V. zu spenden."
          pdf.move_down 3.mm
          pdf.text "Ich bitte um die Ausstellung einer Spendenbescheinigung an folgende Adresse: " 
          pdf.move_down 3.mm

          pdf.font_size(10) do
            pdf.text person.sepa_name
            pdf.text person.sepa_address
            pdf.text person.sepa_zip_code + " " + person.sepa_town
          end
          pdf.move_down 1.cm

          pdf.make_table([
            [{:content => person.town + " den " + Date.today.strftime("%d.%m.%Y"), :height => 30}],
                    ["______________________________", ""],
                [{:content => person.sepa_name, :height => 30}, ""]],
                :cell_style => {:width => 240, :padding => 1,  :border_width => 0, :inline_format => true}).draw
          
 
          
          
          return pdf
        end

        def customize(pdf)
          pdf.font_size 9
          pdf
        end
        
        def sections
          [Donation]
        end
      end
      mattr_accessor :runner
      self.runner = Runner

      def self.render(person, pdf_preview)
        runner.new.render(person, pdf_preview)
      end

      def self.new_pdf(person, pdf_preview)
        runner.new.new_pdf(person, pdf_preview)
      end

    end
  end
end
