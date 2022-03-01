# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.217.4/containers/cpp/.devcontainer/base.Dockerfile

# [Choice] Debian / Ubuntu version (use Debian 11, Ubuntu 18.04/21.04 on local arm64/Apple Silicon): debian-11, debian-10, ubuntu-21.04, ubuntu-20.04, ubuntu-18.04
ARG VARIANT="bullseye"
ARG COMPILER="clang13"

#
# Basic dev tools and Drogon dependencies
#
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT} AS base
# Add backports to apt for latest cmake
RUN echo "deb http://deb.debian.org/debian bullseye-backports main contrib non-free" >> /etc/apt/sources.list
# Install essential dev tools and drogon dependencies
RUN export DEBIAN_FRONTEND=noninteractive             \
    && apt-get update                                 \
    && apt-get -y install                             \
        build-essential cppcheck valgrind gdb         \
        libjsoncpp-dev                                \
        uuid-dev                                      \
        openssl                                       \
        libssl-dev                                    \
        zlib1g-dev                                    \
    && apt-get -y -t bullseye-backports install cmake

#
# Clang 11
#
FROM base AS clang11
RUN export DEBIAN_FRONTEND=noninteractive             \
    && apt-get update                                 \
    && apt-get -y install clang lldb llvm

#
# Clang 13
#
FROM base AS clang13
COPY .llvm-snapshot.gpg.key /etc/.llvm-snapshot.gpg.key
RUN apt-key add /etc/.llvm-snapshot.gpg.key
RUN echo "deb     http://apt.llvm.org/bullseye/ llvm-toolchain-bullseye-13 main" >> /etc/apt/sources.list
RUN echo "deb-src http://apt.llvm.org/bullseye/ llvm-toolchain-bullseye-13 main" >> /etc/apt/sources.list
RUN export DEBIAN_FRONTEND=noninteractive             \
 && apt-get update                                    \
 && apt-get -y install clang-13 llvm-13 lldb-13
