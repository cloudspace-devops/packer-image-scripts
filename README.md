# Cloudspace DevOps -- Packer

The repo contains Clousdpace's scripts & configs to build client VMs (vagrant, AMIs, VMWare, etc.) with Packer.io.

## Building Packer Images

1. Set your AWS key/secret as an environment variable

    ```
    export AWS_ACCESS_KEY_ID="xxxxxxxxx"
    export AWS_SECRET_ACCESS_KEY="xxxxxxx
    ```

2. Create all base images

    ```
    ./build-all.sh
    ```

3. Run the desired individual build script

    ```
    packer build build-name.json
    ```

4. To create a custom project box, copy the closest match into the packer-projects folder, update the base image source, add/create the appropriate shell script(s), and run the build.
