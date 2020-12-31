FROM windev/webdev:FR260056p

# Install the MariaDB client
RUN apt-get update && apt-get install -y mariadb-client

# Install WEBDEV's Native MariaDB Connector
ADD mariadb_install64 .
ADD mariadb_install.zip .
RUN chmod +x ./mariadb_install64
RUN ./mariadb_install64
RUN rm ./mariadb_install64

# TODO: Support specifying webdevuser password (ideally from ENV?)
# See https://forum.pcsoft.fr/en-US/pcsoft.fr.webdev/66428-serveur-application-webdev-24-docker/read.awp
# Abstract:
#   cat /etc/passwd | awk -F: '{print $1}'
#   passwd webdevuser

ENTRYPOINT ["/usr/local/WEBDEV/26.0/wd260admind", "--docker"]
