# Copyright (c) Rahul Bourai. All rights reserved.
# Licensed under the PolyForm Strict License 1.0.0

FROM ubuntu:25.04

# Accept RUNNER_VERSION as a build argument
ARG RUNNER_VERSION
ARG OS_ARCH

# Install necessary packages including .NET Core dependencies
RUN apt-get update && apt-get install --no-install-recommends -y \
    curl \
    jq \
    python3 \
    sudo \
    libicu-dev \
    libkrb5-3 \
    zlib1g \
    iputils-ping \
    openssh-client \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Add a user for the runner
RUN useradd -m -s /bin/bash runner

# Set up the runner user
RUN echo "runner ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /home/runner

# Install Runner

RUN mkdir -p /home/runner/actions-runner && cd /home/runner/actions-runner \
    && curl -o actions-runner.tar.gz -L "https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-${OS_ARCH}-${RUNNER_VERSION}.tar.gz" \
    && tar xzf actions-runner.tar.gz \
    && ./bin/installdependencies.sh

# Copy the start script and make it executable
COPY start.sh /home/runner/start.sh
RUN chown runner:runner /home/runner/start.sh && chmod +x /home/runner/start.sh

# Switch to runner user
USER runner

# Define the entrypoint
ENTRYPOINT ["/home/runner/start.sh"] 