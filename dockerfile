FROM ubuntu:14.04

ADD script/run.sh /run.sh

RUN apt-get update \
&& mkdir /data \
&& apt-get install -y wget \
&& apt-get install -y gcc automake autoconf libtool make \
&& apt-get install -y ruby \
&& cd /usr/local \
&& wget https://rubygems.org/rubygems/rubygems-2.6.11.tgz \
&& tar -zxvf rubygems-2.6.11.tgz \
&& cd /usr/local/rubygems-2.6.11 \
&& ruby setup.rb \
&& gem install redis \
&& cd /usr/local \
&& wget http://download.redis.io/releases/redis-3.2.8.tar.gz \
&& tar -xvf redis-3.2.8.tar.gz \
&& cp /usr/local/redis-3.2.8/redis.conf /usr/local/bin/ \
&& cd /usr/local/redis-3.2.8/deps \
&& make lua hiredis linenoise \
&& cd /usr/local/redis-3.2.8/deps/geohash-int \
&& make \
&& cd /usr/local/redis-3.2.8 \
&& make PREFIX=/usr/local install \
&& cp /usr/local/redis-3.2.8/src/redis-trib.rb /usr/local/bin/ \
&& mv /usr/local/bin/redis-trib.rb /usr/local/bin/redis-trib \
&& chmod +x /usr/local/bin/redis-trib \
&& chmod +x /run.sh \
&& rm -rf /var/lib/apt/lists/* \
&& apt-get purge -y --auto-remove $buildDeps

ENTRYPOINT ["/run.sh"]
