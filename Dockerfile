##///////////////////////////////////////////////////////////////////////
##
## (c) University of Southampton IT Innovation Centre, 2024
##
## Copyright in this software belongs to University of Southampton
## IT Innovation Centre, Southampton, SO17 1BJ, UK.
##
## This software may not be used, sold, licensed, transferred, copied
## or reproduced in whole or in part in any manner or form or in or
## on any media by any person other than in accordance with the terms
## of the Licence Agreement supplied with the software, or otherwise
## without the prior written consent of the copyright owners.
##
## This software is distributed WITHOUT ANY WARRANTY, without even the
## implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE, except where stated in the Licence Agreement supplied with
## the software.
##
##      Created By :            Panos Melas
##      Created Date :          2024-07-09
##      Created for Project :   Telemetry
##
##///////////////////////////////////////////////////////////////////////

FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends apt-utils locales \
               python3-pip cron git \
    && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8

RUN pip3 install mkdocs mkdocs-material mkdocs-material-extensions

RUN mkdir /code

WORKDIR /code

# Copy the script into the image
COPY scripts/build-spyderisk-mkdocs.sh /code/scripts/build-spyderisk-mkdocs.sh

# Copy the cron job file into the cron.d directory
COPY scripts/cronjob /etc/cron.d/spyderisk-docs-cron-job

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/spyderisk-docs-cron-job

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Apply cron job
RUN crontab /etc/cron.d/spyderisk-docs-cron-job

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
