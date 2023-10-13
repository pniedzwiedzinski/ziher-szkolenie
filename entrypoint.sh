#!/bin/sh

if [ ! -f setup ]; then
echo "
droza = Unit.create!(name: '66 PDH "Biała Róża"')
dchicago = Unit.create!(name: '11 PDH "Chicago"')
dgorzyce = Unit.create!(name: '4 PDH "Gorzyce"')
drejtan = Unit.create!(name: '21 PDH im. Tadeusza Rejtana')

roza = User.create!(email: '66@zhr.pl', password: '66@zhr.pl', confirmed_at: '2013-02-23 20:02:00', confirmation_sent_at: '2013-02-23 20:00:00')
UserUnitAssociation.create!(user: roza, unit: droza, can_view_entries: true, can_manage_entries: true)
chicago = User.create!(email: '11@zhr.pl', password: '11@zhr.pl', confirmed_at: '2013-02-23 20:02:00', confirmation_sent_at: '2013-02-23 20:00:00')
UserUnitAssociation.create!(user: chicago, unit: dchicago, can_view_entries: true, can_manage_entries: true)
gorzyce = User.create!(email: '4@zhr.pl', password: '4@zhr.pl', confirmed_at: '2013-02-23 20:02:00', confirmation_sent_at: '2013-02-23 20:00:00')
UserUnitAssociation.create!(user: gorzyce, unit: dgorzyce, can_view_entries: true, can_manage_entries: true)
rejtan = User.create!(email: '21@zhr.pl', password: '21@zhr.pl', confirmed_at: '2013-02-23 20:02:00', confirmation_sent_at: '2013-02-23 20:00:00')
UserUnitAssociation.create!(user: rejtan, unit: drejtan, can_view_entries: true, can_manage_entries: true)
" >> db/seeds.rb
rake db:create:all
rake db:setup 
rake db:migrate

echo "--> Cleaning previously precompiled assets"
rake assets:clobber --trace RAILS_RELATIVE_URL_ROOT=/
rake tmp:cache:clear

echo
echo "--> Precompiling new assets"
rake assets:precompile --trace
touch setup
fi


passenger start -p 3000 -a 0.0.0.0
