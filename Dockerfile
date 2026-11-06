# Use the official Conduit image from GitLab Container Registry
# Dependabot monitors for base image updates weekly
FROM docker.io/matrixconduit/matrix-conduit:v0.10.15

# Set working directory
WORKDIR /app

# Copy the configuration file
COPY conduit.toml /etc/conduit.toml

# Expose the port Conduit uses
EXPOSE 6167

# Set the config file path
ENV CONDUIT_CONFIG=/etc/conduit.toml

