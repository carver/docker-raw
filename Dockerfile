FROM shykes/nodejs

MAINTAINER Jason Carver <ut96caarrs@snkmail.com>

RUN apt-get install -y git

RUN git clone git@github.com:densitydesign/raw.git /opt/raw

RUN cd /opt/raw && npm install

WORKDIR /opt/raw

EXPOSE :4000

CMD ["npm","start"]
