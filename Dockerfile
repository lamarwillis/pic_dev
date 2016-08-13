#######################################
#                                     #
# Dockerfile to define PIC dev env    #
#                                     #
# Based on Ubuntu 16.04               #
#                                     #
#######################################

FROM ubuntu:16.04

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
  picprog=1.9.* \
&& rm -rf /var/lib/apt/lists/*

# Run the bash shell for use/access.
CMD ["/bin/bash"]
