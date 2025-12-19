build-cosmic:
    podman build . -t systema:cosmic -f Containerfile.cosmic

build-niri:
    podman build . -t systema:niri -f Containerfile.niri
