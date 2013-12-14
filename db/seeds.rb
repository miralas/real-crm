# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.destroy_all
roles = Role.create([ 
  {title: "admin"},
  {title: "visiter"},
  {title: "client"}
])
if roles[0].save and roles[1].save and roles[2].save
  puts "Default roles: " + roles.map(&:title).join(', ')
else
  puts '>>> Roles not created!'
end

User.destroy_all
users = User.create([
  {role_id: roles[0].id, account_id: 1, email: 'admin@admin.com',     password: 'admin',   password_confirmation: 'admin' },
  {role_id: roles[1].id, account_id: 2, email: 'visiter@visiter.com', password: 'visiter', password_confirmation: 'visiter' },
  {role_id: roles[2].id, account_id: 3, email: 'client@client.com',   password: 'client',  password_confirmation: 'client' },
  {role_id: roles[2].id, account_id: 3, email: 'miralas@client.com',  password: 'miralas', password_confirmation: 'miralas' }
])
if users[0].save and users[1].save and users[2].save and users[3].save
  puts "Default users: " + users.map(&:role_id).join(', ')
else
  puts '>>> User not created!'
end

Account.destroy_all
accounts = Account.create([
  {owner_id: users[0].id, max_deals: 100,   max_contacts: 50 },
  {owner_id: users[1].id, max_deals: 100,   max_contacts: 50 },
  {owner_id: users[2].id, max_deals: 100,   max_contacts: 50 }
])
if accounts[0].save and accounts[1].save and accounts[2].save
  puts "Default accounts: " + accounts.map(&:owner_id).join(', ')
else
  puts '>>> Accounts not created!'
end

Deal.destroy_all
deals = Deal.create([
  {account_id: accounts[0].id, name: 'first deal',   budget: 50000, responsible: users[0].id },
  {account_id: accounts[1].id, name: 'second_deal',  budget: 50000, responsible: users[1].id },
  {account_id: accounts[2].id, name: 'third deal',   budget: 50000, responsible: users[2].id }
])
if deals[0].save and deals[1].save and deals[2].save
  puts "Default deals: " + deals.map(&:name).join(', ')
else
  puts '>>> Deals not created!'
end

Contact.destroy_all
contacts = Contact.create([
  {name: 'first deal', email: 'first@first.com',   account_id: accounts[0].id, responsible: users[0].id, company_id: 1},
  {name: 'second_deal',email: 'secon@second.com',  account_id: accounts[1].id, responsible: users[1].id, company_id: 2},
  {name: 'third deal', email: 'third@third.com',   account_id: accounts[2].id, responsible: users[2].id, company_id: 3}
])
if contacts[0].save and contacts[1].save and contacts[2].save
  puts "Default contacts: " + contacts.map(&:name).join(', ')
else
  puts '>>> contacts not created!'
end

Company.destroy_all
companys = Company.create([
  {name: 'first deal', email: 'first@first.com',   account_id: accounts[0].id, responsible: users[0].id, contact_id: contacts[0].id},
  {name: 'second_deal',email: 'secon@second.com',  account_id: accounts[1].id, responsible: users[1].id, contact_id: contacts[0].id},
  {name: 'third deal', email: 'third@third.com',   account_id: accounts[2].id, responsible: users[2].id, contact_id: contacts[0].id}
])
if companys[0].save and companys[1].save and companys[2].save
  puts "Default companys: " + companys.map(&:name).join(', ')
else
  puts '>>> companys not created!'
end