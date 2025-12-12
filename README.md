# fly-conduit

A Matrix server running on Fly.io using [Conduit](https://conduit.rs/) - a lightweight Matrix homeserver written in Rust.

## Prerequisites

- A [Fly.io](https://fly.io) account
- [flyctl](https://fly.io/docs/hands-on/install-flyctl/) CLI installed
- Docker (for local testing)

## Setup

1. **Create a Fly.io app:**
   ```bash
   flyctl launch
   ```

2. **Create a volume for persistent data:**
   ```bash
   flyctl volumes create conduit_data --size 1
   ```

3. **Set your Matrix server name:**
   ```bash
   flyctl secrets set CONDUIT_SERVER_NAME=your-domain.com
   ```

4. **Deploy:**
   ```bash
   flyctl deploy
   ```

## Configuration

The server is configured via environment variables. Key settings:

- `CONDUIT_SERVER_NAME`: Your Matrix server's domain name
- `CONDUIT_DATABASE_PATH`: Path to the database (default: `/var/lib/matrix-conduit`)
- `CONDUIT_PORT`: Port the server listens on (default: `6167`)
- `CONDUIT_ADDRESS`: Address to bind to (default: `0.0.0.0`)

See the [Conduit documentation](https://gitlab.com/famedly/conduit/-/blob/next/README.md) for all available configuration options.

### First Setup

At first setup you will need to allow registration, then disable it afterwards.

You can do this by setting:

```sh
fly secrets set CONDUIT_ALLOW_REGISTRATION=true
```

Then setting

```sh
fly secrets set CONDUIT_ALLOW_REGISTRATION=false
```

## Continuous Deployment

This repository includes:

- **GitHub Actions workflow** (`docker-check-and-deploy.yml`): Automatically checks the Dockerfile and deploys to Fly.io on push to main
- **Dependabot**: Weekly checks for dependency updates

To enable automatic deployments, add your `FLY_API_TOKEN` as a GitHub secret.

## Local Development

Build and run locally:

```bash
docker build -t fly-conduit .
docker run -p 6167:6167 -v conduit_data:/var/lib/matrix-conduit fly-conduit
```

## License

See [LICENSE](LICENSE) file for details.
