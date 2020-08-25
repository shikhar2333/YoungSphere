1. yarn install
2. Install Ruby and Ruby on Rails using https://www.howtoforge.com/tutorial/ubuntu-ruby-on-rails/
3. sudo apt install postgresql postgresql-contrib
3. gem install pg -v '1.2.3' --source 'https://rubygems.org/'
4. sudo apt-get install libpq-dev (for pg gem)
5. bundler install
6. Open config/database.yml and setup postgresql database.
    sudo -u postgres createuser -s -i -d -r -l -w <<username>>
    sudo -u postgres psql -c "ALTER ROLE <<username>> WITH PASSWORD '<<password>>';" 
7. rails db:migrate
