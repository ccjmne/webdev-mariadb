FROM windev/webdev:FR260089p

# Install the MariaDB client
RUN apt-get update \
  && apt-get install -y mariadb-client \
  && apt-get install -y default-libmysqlclient-dev

# Install WEBDEV's Native MariaDB Connector and dependencies
COPY build build
RUN chmod +x build/mariadb_install64 build/mysql_install64 \
  && build/mariadb_install64 \
  && build/mysql_install64 \
  && rm -R build

# TODO: Support specifying webdevuser password (ideally from ENV?)
# See 'custom-webdev-password' branch

ENTRYPOINT ["/usr/local/WEBDEV/26.0/wd260admind", "--docker"]
