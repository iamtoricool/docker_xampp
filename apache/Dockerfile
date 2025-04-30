FROM httpd:2.4.58

# Enable mod_rewrite
RUN sed -i '/mod_rewrite.so/s/^#//g' /usr/local/apache2/conf/httpd.conf

# Append custom include at end of original httpd.conf
RUN echo "IncludeOptional conf/auto-projects.conf" >> /usr/local/apache2/conf/httpd.conf

# Copy custom Apache configuration files
COPY auto-projects.conf /usr/local/apache2/conf/auto-projects.conf
COPY custom-vhosts.conf /usr/local/apache2/conf/custom-vhosts.conf 

# Add the custom-vhosts.conf to the main httpd.conf
RUN echo "Include /usr/local/apache2/conf/custom-vhosts.conf" >> /usr/local/apache2/conf/httpd.conf

# Copy the permissions fix script
COPY fix_permissions.sh /usr/local/bin/fix_permissions.sh
RUN chmod +x /usr/local/bin/fix_permissions.sh

# Start the container with permission fixes and Apache
CMD ["bash", "-c", "/usr/local/bin/fix_permissions.sh && httpd-foreground"]
