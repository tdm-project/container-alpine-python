ARG PLATFORM
ARG ALPINE_RELEASE
ARG PYTHON_VERSION

# ============================================================================ #
FROM ${PLATFORM}/alpine:${ALPINE_RELEASE}

LABEL maintainer="Massimo Gaggero <massimo dot gaggero at crs4 dot it>"

ARG PYTHON_VERSION

COPY qemu-arm-static /usr/bin/

# Install required packages
RUN apk add --no-cache python3=~${PYTHON_VERSION}
