FROM ubuntu

RUN apt-get update && \
    apt-get install -y libssl1.0.0 postgresql-client && \
    apt-get autoclean

RUN mkdir -p /app
ARG VERSION=0.0.1
COPY rel/hello_semaphore/releases/${VERSION}/hello_semaphore.tar.gz /app/hello_semaphore.tar.gz
COPY scripts/wait-for-postgres.sh /app/wait-for-postgres.sh
WORKDIR /app
RUN tar xvzf hello_semaphore.tar.gz
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV PORT 8888
CMD ["/app/bin/hello_semaphore", "foreground"]
