FROM windev/webdev:FR250090f

# Install wget and unzip
RUN apt-get update && apt-get install -y wget unzip

# Install the MariaDB client
RUN apt-get install -y mariadb-client

# Get the MariaDB Native Connector
# See https://windev.com/nativeconnectors/ANMariaDB.htm
RUN wget https://package.windev.com/pack/addons/an/mariadb/MARIADBLINUX25PACK64052b.zip
RUN unzip MARIADBLINUX25PACK64052b.zip
RUN chmod +x ./mariadb_install64
RUN ./mariadb_install64

# Clean up
RUN rm ./maria* MARIADBLINUX25PACK64052b.zip

# TODO: Support specifying webdevuser password (ideally from ENV?)
# See https://forum.pcsoft.fr/en-US/pcsoft.fr.webdev/66428-serveur-application-webdev-24-docker/read.awp
# Abstract:
#   cat /etc/passwd | awk -F: '{print $1}'
#   passwd webdevuser

ENTRYPOINT ["/usr/local/WEBDEV/25.0/wd250admind", "--docker"]