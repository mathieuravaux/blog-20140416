FROM ubuntu:saucy
MAINTAINER Peter Ericson <pdericson@gmail.com>

ENV HOME /root

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get clean && rm -fr /var/cache/apt/archives/*

RUN apt-get install -y erlang git unzip wget
RUN apt-get clean && rm -fr /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN cd /usr/local && wget https://github.com/elixir-lang/elixir/releases/download/v0.12.5/Precompiled.zip && unzip Precompiled.zip
RUN cd /usr/local/bin && wget https://github.com/rebar/rebar/wiki/rebar && chmod +x rebar

ADD . blog-20140416

RUN cd blog-20140416 && mix do deps.get, compile
RUN cd blog-20140416 && mix test

EXPOSE 4000

WORKDIR blog-20140416
CMD ["iex", "-S", "mix", "server"]
