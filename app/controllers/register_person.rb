# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.

require Rails.root.join('db', 'seeds', 'support', 'person_seeder')

class RegisterPerson < PersonSeeder

    def seed_person(mail, first, last, group, role)
      Rails.logger.debug("== Initially Seed Person" + first + " " + last)
      attrs = { email: mail,
              first_name: first,
              last_name: last
              }

      Person.seed_once(:email, attrs)
      Rails.logger.debug("== Initially Seed Person add mail:" + mail)
      person = Person.find_by_email(attrs[:email])

      role_attrs = { person_id: person.id, group_id: group.id, type: role.sti_name }
      Role.seed_once(*role_attrs.keys, role_attrs)

      return person
    end

end
