FROM shykes/nodejs

MAINTAINER Jason Carver <ut96caarrs@snkmail.com>

# get the latest package list
RUN apt-get update

# install dependencies
RUN apt-get install -y git python

# make sure we have the latest files
RUN apt-get dist-upgrade

# make sure npm is up to date
RUN npm update npm -g

# make sure all npm packages are up to date
RUN npm update -g

# install bower
RUN npm install -g bower

# add non-root user to run as
RUN adduser rawuser --disabled-password

# run all following commands as rawuser
USER rawuser

# check out repo
RUN git clone https://github.com/densitydesign/raw.git /home/rawuser/raw

# have to manually set $HOME for bower install to work correctly
ENV HOME /home/rawuser

# install dependencies
RUN cd /home/rawuser/raw && bower install

# go to working directory
WORKDIR /home/rawuser/raw

EXPOSE :4000

CMD ["python","-m","SimpleHTTPServer","4000"]
