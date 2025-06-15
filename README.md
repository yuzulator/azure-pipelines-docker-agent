# Azure Pipelines Agent in Docker

This repo runs a self-hosted Azure Pipelines agent inside Docker.

## ✅ Usage

1. Clone the repo:

```bash
git clone https://github.com/yourname/azure-pipelines-docker-agent.git
cd azure-pipelines-docker-agent

2. Build the docker image:
```bash
docker build -t azure-agent .

3. Run the docker container:
```bash
docker run --rm -it --env-file .env azure-agent

