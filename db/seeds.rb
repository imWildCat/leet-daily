# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if UserGroup.count == 0
  UserGroup.create!([
                        {
                            name: 'User'
                        },
                        {
                            name: 'Inactive'
                        },
                        {
                            id: 999,
                            name: 'Admin'
                        }
                    ])
end

unless SiteConfig.find_by_key('report_to_emails')
  SiteConfig.create(key: 'report_to_emails', description: 'The emails to send reports, separated by commas.')
end