FROM erlang:20

ENV RIAK_TAG develop-3.0

WORKDIR /usr/local/src

RUN apt-get update && apt-get install libpam0g-dev -y && \
    git clone git://github.com/basho/riak.git && \
    cd riak && \
    git checkout $RIAK_TAG && \
    make locked-deps && \
    make rel

CMD bash