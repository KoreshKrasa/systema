build:
    podman build . -t systema

build-niri:
    podman build . -t systema:niri -f Containerfile.niri
