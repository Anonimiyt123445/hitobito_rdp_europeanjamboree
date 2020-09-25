# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.

class WelcomeMailer < JamboreeMailer
  default from: "welcome@europeanjamboree.de"

  def welcome_email(person)
    Rails.logger.debug("== Send Mail to" + person.email)
    @mail = person.email
    @url = 'https://europeanjamboree.de/anmeldung'
    @resource = person
    @token = person.generate_reset_password_token!
    mail(to: person.email, subject: "Willkommen bei der Anmeldung zum European Jamboree 2020+1")
  end
end
