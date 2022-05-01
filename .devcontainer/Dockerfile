# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.209.6/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version (use bullseye or stretch on local arm64/Apple Silicon): bullseye, buster, stretch
ARG VARIANT="bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# The following RUN commands are performed as the user "root"
# Create volume:directory for app files and extensions
# Ownership of (empty) root directories is assigned to $USERNAME
ARG USERNAME=vscode
RUN mkdir -p /workspaces/html-container \
    /home/$USERNAME/.vscode-server/extensions \
    /home/$USERNAME/.vscode-server-insiders/extensions \
    && chown -R $USERNAME \
    /workspaces/html-container \
    /home/$USERNAME/.vscode-server \
    /home/$USERNAME/.vscode-server-insiders

# The following COPY command is performed as the user "root"
# Application directory structure is copied with ownership assigned recursively to $USERNAME
COPY --chown=$USERNAME . /workspaces/html-container/

# ** [Optional] Uncomment this section to install additional packages. **
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>