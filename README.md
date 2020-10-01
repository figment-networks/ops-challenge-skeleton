# Figment Ops Challenge

Hello there! This challenge involves bootstraping and monitoring a new [Cosmos](https://cosmos.network/) node on a provided server. We've set up this simple skeleton repo to give you a starting point. Feel free to modify any of this how you see fit!

Download the zip of this repo, carefully read and follow the below outline, then send us a zip of your solution.


## Using this Skeleton

Prerequisites:

- Python 3.6+
- pip

Install ansible & dependencies:

    pip install -r requirements.txt

Add the IP of the remote server (provided separately via email) to inventory:

    echo 1.2.3.4 > config/inventory.ini

Run your playbook:

    bin/provision


## Requirements

Write an ansible role which deploys a [Cosmos mainnet (Hub 3) node](https://hub.cosmos.network/master/gaia-tutorials/join-mainnet.html) to the server in the inventory.

Keep these important aspects in mind:

- **Idempotency** - running the role after initial setup or anytime thereafter should not interfere with node operations
- **Configurability** - it'd be nice to be able to set useful options in variables (for example a list of persistent peers)
- **Resiliency** - the node should be run as a systemd service which will restart after crashes

To avoid having to build binaries on the server, use our existing S3 bucket with appropriate versions of pre-build binaries as well as the genesis file needed to initialise the node:

| URL                                                                                                 |
|-----------------------------------------------------------------------------------------------------|
| https://figment-provisioning.s3.ca-central-1.amazonaws.com/cosmos/gaiad2_0_8                        |
| https://figment-provisioning.s3.ca-central-1.amazonaws.com/cosmos/gaiacli2_0_8                      |
| https://figment-provisioning.s3.ca-central-1.amazonaws.com/cosmos/genesis/genesis--cosmoshub-3.json |

Once you've got the node syncing, prove it! Write a simple monitoring script in Python, also deployed via ansible and also a systemd service. It should retrieve the latest height synced by the node (pst, [check this out](https://docs.tendermint.com/master/rpc/)) and report it as a gauge to the local StatsD server every 10 seconds. Prefix your message with`figment_ops_challenge.<your github username>`. What other metrics might you report on?
