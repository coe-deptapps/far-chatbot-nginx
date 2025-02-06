FROM image-registry.openshift-image-registry.svc:5000/openshift/nginx:1.26-alpine

RUN chmod g+w /var/cache/nginx /var/run

COPY default.conf /etc/nginx/conf.d

EXPOSE 8080

# Make /etc/passwd writable
RUN chmod g+w /etc/passwd

# Copy start-up script
COPY start-up.sh /usr/local/bin/start-up.sh
RUN ls -l /usr/local/bin/

# Set permissions for the start-up script
RUN chmod +x /usr/local/bin/start-up.sh

# Set the entrypoint to the start-up script
ENTRYPOINT ["/usr/local/bin/start-up.sh"]

# Command to run NGINX
CMD ["nginx", "-g", "daemon off;"]
