Packer-definitions
==================

A compilation of my packer definitions to create machine images for AWS, DigitalOcean, Virtualbox, etc.

#Getting started

To create a machine in DigitalOcean for example we can do

```packer build -var "ssh_port=22" -var "hostname=AgileDataScience" -only "debian70wheezy.x64.digitalocean" debian7X.json```

This will create a Droplet running Debian 7.0 Wheezy x64 on the smallest Droplet size (512MB RAM, 1 CPU, 20GB disk size) on the Amsterdam 2 region. It will provision it to install **Puppet**.

#API keys

The API keys for the different services are stored on environment variables and referred from the packer definition. Check the "variables" section (top of the file).

```json
"variables": {
    "ssh_port" : "",
    "hostname" : "",
    "digital_ocean_client_id" : "{{ env `DIGITAL_OCEAN_CLIENT_ID`}}",
    "digital_ocean_api_key" : "{{ env `DIGITAL_OCEAN_API_KEY` }}"
  }
```



