#######################################
#                                     #
# Dockerfile to define PIC dev env    #
#                                     #
# Based on Ubuntu 16.04               #
#                                     #
#######################################

FROM ubuntu:16.04
ARG user

MAINTAINER Lamar Willis

# Freshen the package metadata.
# Install the GNU PIC utilities.
# Install the GNU PIC similator.
# Install the PIC serial programmer software.
# Version numbers are specified to trigger cache busts and
# finally cache cleanup.
RUN apt-get update && apt-get install -y \
  gputils=1.4.* \
  gpsim=0.29.* \
  make=4.1* \
  picprog=1.9.* \
&& rm -rf /var/lib/apt/lists/*

# Set up non-privledged account for user.
# We use the 'shell form', for variable substitution on $user.
RUN /usr/sbin/adduser --disabled-password --gecos '' $user
USER $user

#Symbolic link hack for gpsim.
RUN ln -s /usr/lib/x86_64-linux-gnu/libgtkextra-x11-3.0.so.8 \
    /usr/lib/x86_64-linux-gnu/libgtkextra-x11-3.0.so.7

# Run the bash shell for use/access.
CMD ["/bin/bash"]
