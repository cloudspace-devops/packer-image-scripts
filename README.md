# Cloudspace DevOps -- Packer

The repo contains Clousdpace's scripts & configs to build client VMs (vagrant, AMIs, VMWare, etc.) with Packer.io.

## Default Builds

For most projects you can use a default build and then customize as needed.  Here are links to download default Vagrant (.box files), Virtualbox (.ovf & .vmdk), and aws (ami listed in .txt file)

- Ubuntu: http://devops.cloudspace.com/images/?prefix=images/ubuntu/
- Ubuntu + MySQL: http://devops.cloudspace.com/images/?prefix=images/mysql/
- Ubuntu + NodeJS: http://devops.cloudspace.com/images/?prefix=images/node/
- Ubuntu + PostgreSQL: http://devops.cloudspace.com/images/?prefix=images/postgresql/
- Ubuntu + Ruby: http://devops.cloudspace.com/images/?prefix=images/ruby/
- Ubuntu + Ruby + MySQL: http://devops.cloudspace.com/images/?prefix=images/ruby-mysql/
- Ubuntu + Ruby + PostgreSQL: http://devops.cloudspace.com/images/?prefix=images/ruby-postgresql/

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
