#############################
# Build Nightscout Reporter #
#############################

# Configure Dart
FROM dart:2.12.4-sdk AS build
RUN pub global activate webdev

# Copy repo
COPY . /app
WORKDIR /app

# Build app
RUN pub get
RUN pub global run webdev build --output=web:build


##########################
# Extract nr-pdfmake.rar #
##########################
# TODO: It'd be nice if we could build pdfmake.php from source 
# instead of having to extract a compiled version from a rar?
FROM maxcnunes/unrar as unrar
COPY . /app
RUN unrar x -r /app/nr-pdfmake.rar /app


####################
# Setup PHP Server #
####################
FROM php:7.3-apache AS server

# Copy build, pdfmake and settings.json to server
COPY --from=build /app/build /var/www/html/
COPY --from=build /app/settings-relative.json /var/www/html/settings.json
COPY --from=unrar /app/pdfmake /var/www/html/pdfmake

# Set port
ARG PORT=80
ENV PORT=${PORT}
EXPOSE $PORT
RUN sed -i "s/Listen 80/Listen $PORT/g" /etc/apache2/ports.conf

# Launch webserver
CMD ["apache2-foreground"]
