#!/bin/sh

# This script is a replacement for the standard entrypoint script used in the
# nginx image. It expects that there is a directory from the host mounted at
# `/tmp/import` containing the `nginx.conf.template` file.

# The `nginx.conf.template` is copied to `nginx.conf` Then the `nginx` command
# is run the nginx service.

cat    /tmp/import/nginx.conf.template > /etc/nginx/nginx.conf

nginx -g 'daemon off;'
