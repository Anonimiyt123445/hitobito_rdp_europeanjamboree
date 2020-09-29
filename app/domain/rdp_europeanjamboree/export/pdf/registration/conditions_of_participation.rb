# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.

module RdpEuropeanjamboree
    module Export::Pdf::Registration
      class ConditionsOfParticipation < Section
  
        def render
          pdf.y = bounds.height - 60
          bounding_box([0, 230.mm], width: bounds.width, height: bounds.height - 200) do
            font_size(8) do
              text list, style: :italic, width: bounds.width
            end
          end
        end
  
        private
  
        def list
            pdf.start_new_page
            text "Teilnahmebedingungen", :size => 14
            text "Teilnahme- und Reisebedingungen zur Teilnahme im Deutschen Kontingent zum European Jamboree 2020+1 in Danzig, Polen"
            pdf.move_down 3.mm
            text "Stand September 2020"
            pdf.move_down 3.mm
            text "Veranstalter", :size =>12
            text "Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V. (rdp)"
            text "Chausseestraße 128/129"
            text "10115 Berlin"
            text "Organisation / Kontakt:"
            text "Organisatorischer Ansprechpartner ist u.a. die Kontingentsleitung."
            text "Die Kontingentsleitung ist wie folgt zu erreichen: Telefon: 01717417731 oder E-Mail: kontingentsleitung@europeanjamboree.de (Allgemeine Fragen sind an info@europeanjamboree.de zu senden)."
            pdf.move_down 3.mm
            text "Verantwortlich ist ausschließlich der rdp e.V."
            pdf.move_down 3.mm
            text "Reisezeitraum", :size =>12
            text "Die Fahrt des rdp-Kontingents ist für den Zeitraum vom 28. Juli bis 18. August 2021 (je nach gewählter Buchung) geplant."
            pdf.move_down 3.mm
            text "Reiseziel", :size =>12
            text "Das Reiseziel ist Polen. Dies gilt auch für die Vor- und Nachtouren."
            pdf.move_down 3.mm
            text "Reiseform", :size =>12
            text "Die Reise findet in Units statt. Eine Unit besteht aus 36 Teilnehmer/innen und vier volljährigen Unitleiter/innen. Die Zuteilung in Units wird von der Kontingentsleitung unter Berücksichtigung der Buchung, Wohnort und der Wünsche der Teilnehmer/innen vorgenommen. Dem Ringe-Kontingentsgedanken folgend, sollen die Units aus Teilnehmer*innen aller Ringe-Verbände bestehen. Ein Wechsel zwischen den Buchungen ist in Absprache mit der Kontingentsleitung vor Bildung der Units möglich."
            text "Vor der Reise nach Polen finden verbindliche Vorbereitungstreffen in der zugeteilten Unit statt, die mindestens ein Wochenende umfasst. Die Termine werden von der jeweiligen Unitleitung mitgeteilt."
            text "Die Teilnahme an den Vorbereitungstreffen ist Voraussetzung für die Teilnahme am European Jamboree. Kann die Teilnahme nicht gewährleistet werden, ist Rücksprache mit der Kontingentsleitung zu halten."
            pdf.move_down 3.mm
            text "Teilnahmevoraussetzung", :size =>12
            text "Teilnehmer/innen müssen zwischen dem 28. Juli 2003 und dem 17. August 2007 geboren worden sein. Volljährige können nur als Unit- oder Kontingentsleitung, als Kontingentsteammitglied oder als Mitglieder des International Service Teams (IST) am European Jamboree teilnehmen (mit Ausnahme der bereits angemeldeten Teilnehmer/innen, die zwischen dem Juli 2019 und Juli 2020 18 Jahre alt werden. Für diese Personen ist weiterhin eine reguläre Teilnahme möglich). Eine aktive Mitgliedschaft in einem der folgenden Pfadfinder*innenverbände ist Voraussetzung für die Teilnahme:"
            text "- Bund der Pfadfinderinnen und Pfadfinder (BdP)"
            text "- Deutsche Pfadfinderschaft Sankt Georg (DPSG)"
            text "- Pfadfinderinnenschaft Sankt Georg (PSG)"
            text "- Verband Christlicher Pfadfinderinnen und Pfadfinder (VCP)"
            text "- Bund moslemischer Pfadfinderinnen und Pfadfinder Deutschland (BMPPD)"
            pdf.move_down 3.mm
            text "Zustandekommen des Vertrags", :size =>12
            text "Mit der schriftlichen Anmeldung über die Homepage www.europeanjamboree.de bietet die/der Teilnehmende – soweit minderjährig vertreten durch seinen/ihren gesetzlichen Vertretungsberechtigten – dem Veranstalter verbindlich den Abschluss eines Reisevertrages an. Grundlage dieses Angebotes sind die Reise- und Veranstaltungsausschreibungen sowie die ergänzenden Informationen des Veranstalters."
            text "Die mit allen erforderlichen Unterschriften versehene schriftliche Anmeldung (wird im Laufe des Online-Anmeldeprozesses generiert) muss spätestens 14 Tage nach Abschluss der Online-Anmeldung im Original eingegangen sein. Bei verspätetem Eingang der Dokumente behält sich die Kontingentsleitung eine Annullierung der Anmeldung vor. Eine erneute Anmeldung kann nicht garantiert werden. Bei Personen, die zum Zeitpunkt der Anmeldung das 18. Lebensjahr noch nicht erreicht haben, müssen die vorgenannten Erklärungen durch alle gesetzlichen Vertreter/innen bzw. Berechtigten unterzeichnet sein."
            text "Online-Anmeldeschluss für Teilnehmer/innen, Unitleiter*innen und ISTs ist der 15. Oktober 2020."
            text "Alle IST und CMT müssen sich zusätzlich selbstständig direkt beim European Jamboree 2020+1, voraussichtlich über die Homepage www.ej2020.org oder einen dort benannten Link, anmelden. Sollte keine persönliche Registrierung innerhalb des noch bekanntzugebenden Zeitraums erfolgen kann eine Teilnahme nicht garantiert werden. Insoweit gelten hierfür die Regelungen zum Rücktritt vom Vertrag."
            pdf.move_down 3.mm
            text "Der Reisevertrag über die Teilnahme kommt zustande wenn die Anzahlung auf dem Konto des rdp e.V. eingegangen ist und durch die schriftliche Anmelde-bestätigung/Reisebestätigung des Veranstalters an den/die Teilnehmer/in. Bei oder unverzüglich nach Vertragsabschluss wird der Veranstalter dem/der Teilnehmer/in seine/ihre schriftliche Anmeldebestätigung/Reisebestätigung übermitteln."
            text "Weicht der Inhalt der Anmeldebestätigung/Reisebestätigung vom Buchungsinhalt ab, liegt ein neues Vertragsangebot vor, an welches der Veranstalter für einen Zeitraum von 10 Tagen gebunden ist. Der Vertrag kommt auf der Grundlage dieses neuen Angebots zustande, wenn der/die Teilnehmer*in dieses durch ausdrückliche Annahmeerklärung bestätigt bzw. durch konkludentes Verhalten, insbesondere durch die Vornahme der Anzahlung bzw. Restzahlung, annimmt. "
            text "Die vom Veranstalter gegebenen vorvertraglichen Informationen über wesentliche Eigenschaften der Reiseleistungen, den Reisepreis und alle zusätzlichen Kosten, die Zahlungsmodalitäten und die Stornopauschalen (gem. Artikel 250 § 3 Nummer 1, 3 bis 5 und 7 EGBGB) werden nur dann nicht Bestandteil des Pauschalreisevertrages, sofern dieses zwischen den Parteien ausdrücklich vereinbart ist."
            pdf.move_down 3.mm
            text "Abschluss des Vertrags", :size =>12
            text "Der Veranstalter übermittelt dem/der Teilnehmer/in auf Grundlage seines/ihres Buchungswunsches ein Reiseanmeldeformular zusammen mit diesen Reisebedingungen. Buchungen erfolgen sodann mit dem Vertragsformular. Mit der Buchung bietet der/die Teilnehmer/in den Abschluss des Reiseleistungsvertrages verbindlich an. An die Buchung ist der/die Teilnehmer/in gebunden. Dem Veranstalter steht frei, diese Buchung anzunehmen."
            text "Die Anmeldebestätigung/Reisebestätigung wird dem/der Teilnehmer/in durch den Veranstalter auf elektronischem Wege übersandt."
            text "Die zur Durchführung der Onlinebuchung angebotenen Vertragssprachen sind angegeben. Rechtlich maßgeblich ist ausschließlich die deutsche Sprache. Soweit der Vertragstext im Onlinesystem gespeichert ist, wird der/die Teilnehmer/in darüber und über die Möglichkeit des späteren Abrufes des Vertragstextes unterrichtet. Mit Bestätigung des Buttons „zahlungspflichtig buchen“ bietet der/die Teilnehmer/in den Abschluss des Pauschalreisevertrages verbindlich an. An dieses Vertragsangebot ist er/sie drei Werktage ab elektronischer Erklärung gebunden. Dem/der Teilnehmer*in wird der Eingang der Buchung auf elektronischem Weg bestätigt. Der Vertrag kommt durch Zusendung der Reisebestätigung durch den Veranstalter zustande."
            text "Der Veranstalter weist darauf hin, dass nach den gesetzlichen Vorschriften (§§ 312 Abs. 7, 312g, Abs. 2 Satz 1 Nr. 9 BGB) bei Pauschalreiseverträgen nach § 651a und § 651c BGB die im Fernabsatz (Briefe, Kataloge, Telefonanrufe, E-Mails, Fax, über Mobilfunkdienst versendete Nachrichten, Onlinedienste, Rundfunk und Telemedien) abgeschlossen wurden, kein Widerrufsrecht besteht, sondern lediglich die gesetzlichen Rücktritts- und Kündigungsrechte gelten, insbesondere das Rücktrittsrecht gemäß § 651h BGB. Ein Widerrufsrecht besteht jedoch, wenn der Vertrag über Reiseleistungen nach  § 651a BGB außerhalb von Geschäftsräumen geschlossen ist. Es sei denn, die mündlichen Verhandlungen, auf denen der Vertragsabschluss beruht, sind auf vorhergehende Bestellung des Verbrauchers/der Verbraucherin geführt worden; im letztgenannten Fall besteht ein Widerrufsrecht ebenfalls nicht."
            pdf.move_down 3.mm
            text "Teilnahmebeitrag/ Preiserhöhungen", :size =>12
            text "Der Teilnahmebetrag richtet sich nach der gebuchten Teilnahmevariante (mit oder ohne Vor-/Nachtour) sowie nach der Funktion im Kontingent (Unitteilnehmende*r, Unitleitung, IST oder Kontingentsteam) und staffelt sich wie folgt:"
            pdf.move_down 3.mm
            text "Für alle Zahlungen ist die Erteilung eines SEPA-Basis-Lastschriftmandates zwingend erforderlich."
            text "Falls sich nach Vertragsabschluss Beförderungskosten, Steuern oder Wechselkurse verändern oder Änderungen am Programm vorgenommen werden müssen, behält sich der rdp e.V. vor, den Teilnahmebeitrag, um den Erhöhungsbetrag anzupassen. Eine Preiserhöhung ab dem 20. Tag vor Reiseantritt ist unwirksam. Bei einer Preiserhöhung von mehr als 5%, ist der Teilnehmende berechtigt, kostenfrei vom Vertrag zurückzutreten. Bereits erhaltene Leistungen (z.B. Vortreffen) werden jedoch angerechnet, darüber hinaus entrichtete Beträge zurückerstattet. Das Rücktrittsrecht muss gegenüber dem rdp e.V. schriftlich geltend gemacht werden und zwar spätestens 14 Tage nach Bekanntgabe einer Preiserhöhung bzw. Änderung der Reiseleistung."
            pdf.move_down 3.mm
            text "Rücktritt und Kündigung", :size =>12
            text "Grundsätzlich ist der geschlossene Vertrag für beide Seiten bindend. Ein Rücktrittsrecht besteht für gesetzlich vorgesehene Fälle. Tritt die/der Teilnehmende vom Vertrag zurück oder nimmt nicht an der Reise teil, steht dem rdp e.V. ein Schadenersatzanspruch zu. Ein Rücktritt ist schriftlich an den rdp e.V zu richten. Andere sind nicht berechtigt, für den rdp e.V. den Rücktritt entgegenzunehmen. Dies gilt auch für einen Abbruch der bereits angetretenen Reise zum European Jamboree nach Polen."
            text "- Sofern dem rdp e.V. durch den Rücktritt eines/einer Teilnehmenden ein zusätzlicher Schaden entsteht, ist dieser durch die/den Teilnehmenden zu erstatten."
            text "- Eine Benennung einer*eines Ersatzteilnehmenden und damit eine Reduzierung des Schadens ist nur bis zu 4 Wochen vor dem ersten Unittreffen möglich."
            text "- Eine Anwendung einer Härtefallregelung kann bei der KL schriftlich beantragt werden."
            pdf.move_down 3.mm
            text "Hinweis: Eine nicht erteilte Schulbefreiung oder fehlende Einreisedokumente berechtigen nicht zum kostenfreien Reiserücktritt."
            pdf.move_down 3.mm
            text "Der rdp e.V. kann bei einer Absage des „European Jamborees“ durch den Veranstalter (ZHP, Polen) vom Vertrag zurücktreten."
            pdf.move_down 3.mm
            text "Zusätzlich kann der rdp e.V. kann neben den gesetzlichen Gründen bei folgenden Sachverhalten vom Vertrag zurücktreten:"
            text "- erhebliches vertragswidriges Verhalten des*der Teilnehmenden und erfolgter schriftlicher Mahnung in Textform (z.B. E-Mail) "
            text "- wenn Lastschriften nicht eingelöst werden oder ihnen widersprochen wurde und nach schriftlicher Aufforderung der ausstehende Teil des Teilnahmebeitrags sowie anfallender Gebühren nicht innerhalb von zwei Wochen bezahlt wird"
            text "- wenn der*die Teilnehmer*in nicht an den Vorbereitungstreffen teilnimmt"
            text "- wenn keine oder nicht rechtzeitige persönliche Anmeldung für IST und CMT auf der noch zu benennenden Internetseite des ZHP erfolgt"
            text "- wenn die bei der Anmeldung abgefragten Daten zur Gesundheitsvorsorge nicht wahrheitsgemäß dem rdp zur Verfügung gestellt wurden"
            text "- wenn der*die Teilnehmer*in gegen die Satzung des jeweiligen Verbandes (BdP, BMPPD, DPSG, PSG oder VCP) verstößt"
            text "- wenn der*die Teilnehmer*in die Mitgliedschaft in seinem*ihrem Verband (BdP, BMPPD, DPSG, PSG oder VCP) aufgibt oder verliert"
            text "- wenn andere wichtige Gründe es für den rdp e.V. unzumutbar erscheinen lassen, am Vertrag festzuhalten"
            pdf.move_down 3.mm
            text "Tritt der rdp e.V. aus einem, im vorherigen Abschnitt genannten Grund von dem Vertrag zurück, hat der/die Teilnehmende dem rdp e.V. den entstandenen Schaden zu ersetzen. Eventuelle Mehrkosten für die Rückbeförderung von einem Treffen oder dem European Jamboree selbst, muss der/die Teilnehmende selbst tragen. Es steht dem*der Teilnehmenden frei, einen geringeren oder keinen Schaden nachzuweisen. Der rdp e.V. kann weitergehende Schäden ebenfalls geltend machen."
            pdf.move_down 3.mm
            text "Kündigung infolge höherer Gewalt", :size =>12
            text "Erschwerungen, Gefährdungen oder Beeinträchtigungen erheblicher Art durch nicht vorhersehbare Umstände wie Krieg, innere Unruhen, Epidemien, hoheitliche Anordnungen (Entzug der Landesrechte, Grenzschließungen), Naturkatastrophen, Havarien, Zerstörung von Unterkünften oder Gleichwertiges berechtigen den Veranstalter und den/die Teilnehmer/in zur Kündigung. Wird der Vertrag gekündigt, so kann der Veranstalter für die bereits erbrachten oder zur Beendigung der Reise noch zu erbringenden Leistungen Entschädigung verlangen. Der Veranstalter ist im Kündigungsfalle zur Rückbeförderung verpflichtet, falls der Vertrag die Beförderung mitumfasst. Mehrkosten der Rückbeförderung, soweit im Vertrag enthalten, tragen der Veranstalter und der/die Teilnehmer/in je zur Hälfte. Alle übrigen Mehrkosten muss der/die Teilnehmer*in tragen. "
            pdf.move_down 3.mm
            text "Aufwandsersatz bei Rücktritt", :size =>12
            text "Im Falle des Rücktritts des Teilnehmers/der Teilnehmer/in  kann der Veranstalter Aufwandsersatz nach Maßgabe folgender Stornokosten pro angemeldetem/angemeldeter Teilnehmer/in verlangen, sofern nicht der Beweis erbracht wird, dass dem Veranstalter geringere Kosten entstanden sind:"
            pdf.move_down 3.mm
            text "Unitteilnehmende*r:", :size =>10
            text "Rücktritt bis 31.12.2020   500 EUR"
            text "Rücktritt bis 31.03.2020   875 EUR"
            text "Rücktritt bis 01.05.2020   1.250 EUR"
            pdf.move_down 3.mm
            text "Unitleitung", :size =>10
            text "Rücktritt bis 31.12.2020   360 EUR"
            text "Rücktritt bis 31.03.2021   630 EUR"
            text "Rücktritt bis 01.05.2021   900 EUR"
            pdf.move_down 3.mm
            text "IST:", :size =>10
            text "Rücktritt bis 31.12.2020   300 EUR"
            text "Rücktritt bis 31.03.2021   525 EUR"
            text "Rücktritt bis 01.05.2021   750 EUR"
            pdf.move_down 3.mm
            text "Leistungen", :size =>12
            text "Folgende Leistungen sind in allen Paketen enthalten:", :size =>10
            text "-	mindestens ein Vorbereitungstreffen/Vorbereitungswochenende für Unitteilnehmende und Unitleitungen in Deutschland inklusive An- und Abreise "
            text "-	Kontingents-Vorbereitungslager vom 13.05. – 16.05.2021 in Westernohe (DPSG Bundeszentrum) inkl. An- und Abreise innerhalb Deutschlands*"
            text "-	Jamboree (Ringe) Kluft/Tracht mit dazugehörigen Aufnähern und Ringehalstuch"
            text "-	Programm- und Vorbereitungskosten des rdp-Kontingents"
            text "-	Reisepreissicherungsschein des Veranstalters (rdp)"
            text "-	Haftpflicht- und Unfallversicherung"
            text "-	Teilnahme am European Jamboree 2020+1 in Gdansk (Danzig)/Polen mit An- und Abreise (außer IST) aus Deutschland nach Polen und zurück."
            text "-	Zentraler Transport des Unit- und Kontingentsmaterials aus Deutschland nach Polen und zurück. Nach Verfügbarkeit können sich IST dem zentralen Materialtransport anschließen."
            pdf.move_down 3.mm
            text "Folgende zusätzliche Leistungen sind bei einer Buchung Vor- oder Nachtour enthalten:", :size =>10
            text "-	5 Nächte (6 Tage) nach individueller Reiseplanung durch die jeweiligen Unitleitungen mit Unterkunft (Zelt, Hostel, etc. sowie Verpflegung, Programm und Reisekosten)."
            pdf.move_down 3.mm
            text "Im Teilnehmer/innenbeitrag sind nicht enthalten:"
            text "-	Reiserücktrittskostenversicherung"
            text "-	Gepäckversicherung"
            text "-	persönliche Ausgaben"
            text "-	Kosten zur Sicherstellung der Einreise nach Polen"
            text "-	Auslandskrankenversicherung (wird als EU-Bürger*in grundsätzlich nicht benötigt)"
            text "-	Krankenrücktransportversicherung"
            pdf.move_down 3.mm
            text "Der Abschluss einer Reiserücktrittskosten- und Materialversicherung sowie einer Auslandskrankenversicherung zur Übernahme der nicht durch das deutsche Krankenversicherungssystem abgedeckten Kosten (z.B. Krankenrücktransport) wird dringend empfohlen."
            pdf.move_down 3.mm
            text "Versicherungen sowie Pass-, Visa- und Gesundheitsvorschriften", :size =>12
            text "Für die Dauer der Freizeitmaßnahme sind alle Teilnehmenden im Rahmen einer Unfall- und Haftpflichtversicherung versichert. "
            text "Der/die Teilnehmer/in ist selbst verantwortlich für das Beschaffen und Mitführen der notwendigen Reisedokumente, die Durchführung eventuell erforderlicher Impfungen sowie das Einhalten von Zoll- und Devisenvorschriften. Nachteile, die aus der Nichtbefolgung dieser Vorschriften erwachsen, z. B. die Zahlung von Rücktrittskosten, gehen zu seinen Lasten. Dies gilt nicht, wenn der Veranstalter schuldhaft nicht, unzureichend oder falsch informiert hat."
            text "Der Veranstalter haftet nicht für die rechtzeitige Erteilung und den Zugang notwendiger Visa durch die jeweilige diplomatische Vertretung, wenn der/die Teilnehmer*in den Veranstalter mit der Besorgung beauftragt hat, es sei denn, dass der Veranstalter eigene Pflichten schuldhaft verletzt hat."
            pdf.move_down 3.mm
            text "Leistungsänderungen", :size =>12
            text "Die auf der Webseite enthaltenen Angaben sind für den Veranstalter bindend. Bezüglich der Reiseausschreibung behält sich der Veranstalter in Übereinstimmung mit § 4 Abs.2 BGB-InfoV ausdrücklich vor, aus sachlich berechtigten, erheblichen und nicht vorhersehbaren Gründen vor Vertragsabschluss eine Änderung der Ausschreibungen zu erklären, über die der/die Teilnehmer/in vor Buchung informiert wird. Änderungen oder Abweichungen einzelner Reiseleistungen von dem vereinbarten Inhalt des Reisevertrages (z. B. Änderungen des Programmablaufs), die nach Vertragsabschluss notwendig werden und die vom Veranstalter nicht wider Treu und Glauben herbeigeführt wurden, sind nur gestattet, soweit die Änderungen oder Abweichungen nicht erheblich sind und den Gesamtzuschnitt der gebuchten Reise nicht beeinträchtigen. Eventuelle Gewährleistungsansprüche bleiben unberührt, soweit die geänderten Leistungen mit Mängeln behaftet sind. Der Veranstalter ist verpflichtet, den/die Teilnehmer/in über Leistungsänderungen oder -abweichungen unverzüglich in Kenntnis zu setzen. Gegebenenfalls wird der Veranstalter dem/der Teilnehmer*in eine kostenlose Umbuchung oder einen kostenlosen Rücktritt anbieten. "
            pdf.move_down 3.mm
            text "Weitere vertragliche Pflichten", :size =>12
            text "Der/die Teilnehmer/in muss sich um gültige Reisedokumente und ggf. Einreisegenehmigungen kümmern. Für deutsche Staatsangehörige heißt das, dass zur Einreise ein für die Dauer des Aufenthaltes gültiger Personalausweis oder Reisepass erforderlich ist. Nicht deutsche Staatsbürger/innen müssen sich rechtzeitig informieren, welche Dokumente sie benötigen und diese mit sich führen. Durch Nichteinhaltung entstehende Kosten sind durch den/die Teilnehmer*in zu tragen. "
            text "Die bei der Anmeldung oder zu einem späteren Zeitpunkt abgefragten Daten zur Gesundheitsvorsorge müssen wahrheitsgemäß bzw. zur Teilnahme an einzelnen Programmpunkten verantwortlich beantwortet werden. Die Einreichung des Fragebogens ist notwendig, da die medizinische Versorgung nur auf der Basis der vorliegenden Informationen übernommen werden kann. Eine Teilnahme, z.B. an Wasseraktivitäten ist nur bei entsprechender Erlaubnis der Erziehungsberechtigten möglich."
            text "Für die gesundheitliche Betreuung steht während des European Jamborees auf dem Veranstaltungsgelände ein Rettungs- und Sanitätsdienst zur Verfügung. In medizinischen Notfällen, welche nicht vor Ort versorgt werden können, wird bei Bedarf und Entscheidung des Rettungsdienstes eines der umliegenden Krankenhäuser aufgesucht. Krankenrücktransporte bei medizinisch indizierten Notfällen sind ausschließlich über eine empfohlene Zusatzversicherung abgedeckt."
            text "Vor Reisebeginn ist die „Einverständniserklärung für ein ohne Eltern reisendes Kind“ bei der jeweiligen Unitleitung abzugeben. "
            pdf.move_down 3.mm
            text "Haftungsbeschränkung", :size =>12
            text "Die vertragliche Haftung des Veranstalters für Schäden, die nicht aus Verletzung des Lebens, des Körpers oder der Gesundheit resultieren und nicht schuldhaft herbeigeführt wurden, ist auf den dreifachen Reisepreis beschränkt, "
            text "a) soweit ein Schaden des/der Teilnehmenden weder vorsätzlich noch grob fahrlässig herbeigeführt wird oder "
            text "b) soweit der Veranstalter für einen dem/der Teilnehmenden entstehenden Schaden allein wegen eines Verschuldens eines Leistungsträgers verantwortlich ist. Die deliktische Haftung des Veranstalters für Sachschäden, die nicht auf Vorsatz oder grober Fahrlässigkeit beruhen, ist auf den dreifachen Reisepreis beschränkt. Diese Haftungshöchstsumme gilt jeweils je Teilnehmer*in und Reise. Möglicherweise darüber hinausgehende Ansprüche im Zusammenhang mit Reisegepäck nach dem Montrealer Übereinkommen bleiben von der Beschränkung unberührt. "
            pdf.move_down 3.mm
            text "Ausschluss von Ansprüchen und Verjährung", :size =>12
            text "Ansprüche des/der TeilnehmersIin wegen nicht vertragsgemäßer Erbringung sind innerhalb eines Monats nach vertraglich vorgesehener Beendigung der Reise gegenüber dem Veranstalter unter der unten angegeben Anschrift geltend zu machen. Nach Ablauf der Frist kann der/die Teilnehmer/in Ansprüche geltend machen, wenn er/sie ohne Verschulden an der Einhaltung der Frist verhindert worden ist. Dies gilt jedoch nicht für die Frist zur Anmeldung von Gepäckschäden."
            text "Ansprüche des Reisenden nach den §§ 651 c bis f BGB, ausgenommen solche wegen Körper- und Gesundheitsschäden, verjähren nach einem Jahr. Die Verjährungsfrist beginnt mit dem Tag, an dem die Reise dem Vertrag nach enden sollte. Hat der/die Teilnehmer*in solche Ansprüche geltend gemacht, so ist die Verjährung bis zu dem Tag gehemmt, an dem der Veranstalter die Ansprüche schriftlich zurückweist. Ansprüche aus unerlaubter Handlung verjähren in drei Jahren. "
            pdf.move_down 3.mm
            text "Allgemeines", :size =>12
            text "Sonderabsprachen sind nur dann wirksam, wenn sie durch den rdp e.V. schriftlich bestätigt wurden. Mündliche Absprachen haben keine Rechtsgeltung. Die Unwirksamkeit einzelner Bestimmungen des Reisevertrags und der Teilnahmebedingungen hat nicht zwingend die Unwirksamkeit des gesamten Reisevertrags / Teilnahmebedingungen zur Folge. Unwirksame Bestimmungen können durch solche ersetzt werden, die den angestrebten wirtschaftlichen Zweck möglichst weitgehend erreichen."
        end
      end
    end
  end
  