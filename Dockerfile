FROM owncloud:8.2
MAINTAINER Li Yi <denverdino@gmail.com>
COPY owncloud_autoconfig.php /root/owncloud_autoconfig.php
COPY bootstrap.sh /entrypoint.sh



