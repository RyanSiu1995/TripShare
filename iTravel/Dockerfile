FROM ruby:2.3.1
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs
# RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
# RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
# RUN apt-get update && apt-get install -y python-software-properties software-properties-common postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3 build-essential libpq-dev nodejs
# USER postgres
# RUN    /etc/init.d/postgresql start &&\
#     psql --command "create role iTravel with createdb login password 'password1';"
# RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf
# RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf
# RUN sed -e "s/[#]\?listen_addresses = .*/listen_addresses = '*'/g" -i '/etc/postgresql/9.3/main/postgresql.conf'
# RUN namp -p 5432 localhost
# EXPOSE 5432
# USER root
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
# RUN rails db:reset
EXPOSE 3000