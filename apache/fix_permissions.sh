#!/bin/bash

CONF_FILE="/usr/local/apache2/conf/auto-projects.conf"
> "$CONF_FILE"

for dir in /var/www/html/*; do
  if [ -d "$dir/public" ]; then
    name=$(basename "$dir")
    echo "Alias /$name \"$dir/public\"" >> "$CONF_FILE"
    echo "<Directory \"$dir/public\">" >> "$CONF_FILE"
    echo "    AllowOverride All" >> "$CONF_FILE"
    echo "    Require all granted" >> "$CONF_FILE"
    echo "</Directory>" >> "$CONF_FILE"
  fi
done
