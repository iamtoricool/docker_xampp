FROM httpd:2.4.58

# Enable mod_rewrite
RUN sed -i '/mod_rewrite.so/s/^#//g' /usr/local/apache2/conf/httpd.conf

# Allow .htaccess usage
RUN echo "<Directory \"/var/www/html\">\n\
    AllowOverride All\n\
    Require all granted\n\
</Directory>" >> /usr/local/apache2/conf/httpd.conf
