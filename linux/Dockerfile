FROM ubuntu:20.04

ENV AGENT_VERSION=4.258.1
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        curl \
        wget \
        libcurl4 \
        libunwind8 \
        libicu66 \
        ca-certificates \
        tar \
        sudo \
        unzip && \
    apt-get clean

RUN useradd -m azure && mkdir -p /azagent && chown azure /azagent
USER azure
WORKDIR /azagent

# Download and extract the agent
# RUN wget https://vstsagentpackage.azureedge.net/agent/${AGENT_VERSION}/vsts-agent-linux-x64-${AGENT_VERSION}.tar.gz && \
#     tar zxvf vsts-agent-linux-x64-${AGENT_VERSION}.tar.gz && \
#     rm vsts-agent-linux-x64-${AGENT_VERSION}.tar.gz

RUN wget https://download.agent.dev.azure.com/agent/${AGENT_VERSION}/vsts-agent-linux-x64-${AGENT_VERSION}.tar.gz && \
    tar zxvf vsts-agent-linux-x64-${AGENT_VERSION}.tar.gz && \
    rm vsts-agent-linux-x64-${AGENT_VERSION}.tar.gz

COPY start.sh .
RUN chmod +x start.sh

ENTRYPOINT ["./start.sh"]
