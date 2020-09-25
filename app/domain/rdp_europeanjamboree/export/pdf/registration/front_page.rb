# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.

module RdpEuropeanjamboree
  module Export::Pdf::Registration
    class FrontPage < Section
      def render
          bounding_box([0.mm,220.mm], :width => 85.mm, :heigth => 45.mm) do
            font_size(6) do
              pdf.text @person.first_name +
                        " " + @person.last_name +
                        ", " + @person.address +
                        ", " + @person.zip_code +
                        " " + @person.town
            end

            font_size(10) do
              pdf.text " "
              pdf.text "Ring deutscher Pfadfinder*innenverbände e.V."
              pdf.text "c/o BdP Bundesamt"
              pdf.text "Kesselhaken 23"
              pdf.text "34376 Immenhausen"
            end

          end

          bounding_box([0.mm,170.mm], :width => 150.mm, :heigth => 45.mm) do
            font_size(10) do
              pdf.text "Anmeldung von", :size => 10
              pdf.move_down 2.mm
              pdf.text @person.full_name , :size => 14
              pdf.move_down 2.mm
              pdf.text "als " + @person.role, :size => 10
              pdf.move_down 2.mm
              pdf.text "für das Deutsche Kontingent zum European Jamboree 2020+1" , :size => 10
              pdf.text "#" + @person.id.to_s,  :size => 10
              #stroke_horizontal_rule
            end
          end

          pdf.move_down 2.cm

          bounding_box([0, cursor], width: bounds.width) do
            font_size(10) do
              text list, style: :italic, width: bounds.width - 80
            end


          pdf.start_new_page
        end
      end
        private

      def list
        @personal_data = pdf.make_table([
          [{:content => "<font size='12'>Kontaktdaten</font>", :height => 30, :colspan => 2}],
          [{:content => "Nachname:", :width => 150},@person.last_name],
          ["Vorname:",@person.first_name],
          ["Geburtstag:",@person.birthday.strftime("%d.%m.%Y")],
          ["Email:",@person.email],
          ["Strasse:",@person.address],
          ["PLZ:",@person.zip_code],
          ["Stadt:",@person.town],
          ["Land:",@person.country],
          ["Verband:",@person.rdp_association],
          ["Landesverband / Diözese:",@person.rdp_association_region],
          ["Region / Bezirk:",@person.rdp_association_sub_region],
          ["Stamm bzw. Ortsgruppe:",@person.rdp_association_group],
          ["Mitgliedsnummer:",@person.rdp_association_number]],
          :cell_style => {:padding => 2, :border_width => 0, :inline_format => true})
        @personal_data.draw
        text "" #gets rid of strange numbers in last line
      end
    end
  end
end
