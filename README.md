1. yarn install
2. Install Ruby and Ruby on Rails using https://www.howtoforge.com/tutorial/ubuntu-ruby-on-rails/
3. sudo apt install postgresql postgresql-contrib
3. gem install pg -v '1.2.3' --source 'https://rubygems.org/'
4. sudo apt-get install libpq-dev (for pg gem)
5. bundler install
6. Open config/database.yml and setup postgresql database.
   * Create a database 'youngsphere'
   * ALTER USER postgres PASSWORD 'myPassword'
   Now, fill these values under development.
7. rails db:migrate
   * For peer authentication error, use https://stackoverflow.com/questions/18664074/getting-error-peer-authentication-failed-for-user-postgres-when-trying-to-ge
8. Open 2 tabs:
    1st tab: rails server
    2nd tab: ./bin/webpack-dev-server 
