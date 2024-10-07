# Use an appropriate base image
FROM openjdk:11-jdk

# Install necessary packages
RUN apt-get update && \
    apt-get install -y lua-filesystem xsltproc docbook-xsl \
    fop libxerces2-java libsaxon-java libfop-java libjeuclid-fop-java && \
    apt-get clean

# Add FOP 2.6
RUN curl -L -o fop.zip https://archive.apache.org/dist/xmlgraphics/fop/2.6/fop-2.6-bin.zip && \
    unzip fop.zip -d /opt/fop && \
    rm fop.zip

# Update fop path and add find_jars line
RUN echo "find_jars jeuclid-core jeuclid-fop" >> /usr/bin/fop

# Set the working directory
WORKDIR /app

# Copy your project files into the container
COPY . .

# Define the command to run when starting the container
CMD ["bash", "-c", "lua CopyWebsite.lua && lua BuildComputerFO.lua"]
