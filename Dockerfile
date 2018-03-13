FROM resin/rpi-raspbian

# Install nginx and ffmpeg
RUN apt-get update && apt-get install -y \
   nginx \
   ffmpeg \
   && rm -rf /var/cache/apk/* && mkdir /tmp/stream
COPY nginx/nginx.conf /etc/nginx/nginx.conf

COPY ./startup.sh /
COPY ./create_ffmpeg_cmd.sh /
RUN ["chmod", "+x", "/startup.sh"]
RUN ["chmod", "+x", "/create_ffmpeg_cmd.sh"]

CMD ["/startup.sh"]
