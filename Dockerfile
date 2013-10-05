FROM shykes/nodejs

MAINTAINER Jason Carver <ut96caarrs@snkmail.com>

RUN apt-get update

RUN apt-get install -y git

RUN git clone https://github.com/densitydesign/raw.git /opt/raw

RUN adduser raw --disabled-password

RUN chown raw:raw /opt/raw

RUN npm update

RUN npm install -g bower

RUN su - raw -c "cd /opt/raw && bower install"

WORKDIR /opt/raw

EXPOSE :4000

USER raw

CMD ["npm","start"]
