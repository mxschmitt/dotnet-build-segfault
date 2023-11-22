ARG SDK_VERSION
FROM --platform=linux/arm64 mcr.microsoft.com/dotnet/sdk:${SDK_VERSION}-jammy

COPY ./MyFancyLibrary/output/* /tmp/

RUN mkdir /tmp/work && \
    cd /tmp/work && \
    dotnet new console && \
    echo '<?xml version="1.0" encoding="utf-8"?><configuration><packageSources><add key="local" value="/tmp/"/></packageSources></configuration>' > nuget.config && \
    dotnet add package MyFancyLibrary --prerelease && \
    dotnet build
