
# Thunderbird in a docker container
#
# Distributed under the Mozilla Public License 2.0, this is free software.
#
# Usage
# docker run -d name thunderbird \
# -v ~/.thunderbird:/root/.thunderbird \
# -e DISPLAY=`ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'`:0 \
# jyeary/thunderbird:1.0.0
FROM ubuntu:18.10
MAINTAINER John Yeary <jyeary@bluelotussoftware.com>
RUN apt-get -y update \
    && apt-get install -y thunderbird \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoremove -y
CMD ["thunderbird"]
