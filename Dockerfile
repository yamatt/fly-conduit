# Use the official Conduit image from GitLab Container Registry
# Dependabot monitors for base image updates weekly
FROM registry.gitlab.com/famedly/conduit/matrix-conduit:v0.10.12

# Set working directory
WORKDIR /app

# Copy the configuration file
COPY conduit.toml /etc/conduit.toml

# Expose the port Conduit uses
EXPOSE 6167

# Set the config file path
ENV CONDUIT_CONFIG=/etc/conduit.toml

