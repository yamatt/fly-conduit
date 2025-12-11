# Use the official Conduit image from GitLab Container Registry
FROM registry.gitlab.com/famedly/conduit/matrix-conduit:latest

# Set working directory
WORKDIR /app

# Create a directory for the database
RUN mkdir -p /var/lib/matrix-conduit

# Expose the port Conduit uses
EXPOSE 6167

# Set the database path
ENV CONDUIT_DATABASE_PATH=/var/lib/matrix-conduit
ENV CONDUIT_PORT=6167
ENV CONDUIT_ADDRESS=0.0.0.0

# Run Conduit
CMD ["/usr/local/bin/matrix-conduit"]
