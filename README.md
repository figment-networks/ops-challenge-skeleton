# Figment Ops Challenge

Hello there! This challenge involves bootstraping and monitoring a new [Cosmos](https://cosmos.network/) node using Docker. We've set up this simple skeleton repo to give you a starting point. Feel free to modify any of this how you see fit!

Download the zip of this repo, carefully read and follow the below outline, then send us a zip of your solution.


## Using this Skeleton

Prerequisites:

- docker
- docker-compose

Start docker-compose

```
docker-compose up -d
```

This will start up a container running Systemd with the current directory mounted into `/tmp/ansible` ready to be used

Exec into the docker container

```
docker-compose exec ops-challenge /bin/bash
```

Run ansible

```
./bin/provision
```

You can now make changes in the repo and run them within the container as needed.

To stop the container and get a fresh container just run

```
docker-compose down -t 0
docker-compose up --force-recreate -d
```


## Requirements

Write an ansible role which deploys a [Cosmos mainnet (Hub 4) node](https://github.com/cosmos/mainnet) to the docker container running as the figment user.  **The role only needs to start the process of syncing it does not need to preform the binary change at height 6910000**.

The role should:
- Build the required binary from source
- Init a new node

Keep these important aspects in mind:

- **Idempotency** - running the role after initial setup or anytime thereafter should not interfere with node operations
- **Configurability** - it'd be nice to be able to set useful options in variables (for example a list of persistent peers)
- **Resiliency** - the node should be run as a systemd service which will restart after crashes


Once you've got the node syncing, prove it! Write a simple monitoring script in Python, also deployed via ansible and also a systemd service. It should:
 - Retrieve the latest block height synced by the node (pst, [check this out](https://docs.tendermint.com/master/rpc/))
 - Report it using a Prometheus/openmetrics endpoint.
