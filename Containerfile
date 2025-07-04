ARG SOURCE_IMAGE="cosmic-atomic"
ARG SOURCE_SUFFIX="-main"
ARG SOURCE_TAG="42"

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

COPY build.sh /tmp/build.sh
ADD https://github.com/ShadowBlip/gamescope-dbus/releases/download/v1.8.0/gamescope-dbus-1.8.0-1.x86_64.rpm /tmp/gamescope-dbus.rpm
ADD https://github.com/ShadowBlip/InputPlumber/releases/download/v0.44.1/inputplumber-0.44.1-1.x86_64.rpm /tmp/inputplumber.rpm
ADD https://kojipkgs.fedoraproject.org//packages/gamescope/3.15.15/2.fc42/x86_64/gamescope-3.15.15-2.fc42.x86_64.rpm /tmp/gamescope.rpm

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
