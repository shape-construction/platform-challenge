# DNS zone move

## Introduction

We want to move one of our DNS zones from AWS to Cloudflare and this repo contains the terraform code we used to bootstrap the existing zone in AWS.

One of the objectives of this exercise is for you to interact with us as if you were working alongside us.
We want you to talk to us throughout the exercise with your thougths and ideas on how to acomplish this.
If there's anything that's missing in this challenge description feel free to state your assumptions.

We're here to help as well and to have a healthy discussion as we work together with you.

Have fun!

## Pre-requisites

You have to have terraform installed, we suggest using [tfenv](https://github.com/tfutils/tfenv).

## Preparation

We'll give you a set of AWS keys which you'll need to first bootstrap the infrastructure.
Make sure that before running any terraform code you need to set them as such:

```
export AWS_ACCESS_KEY_ID=<SECRET KEY ID>
export AWS_SECRET_ACCESS_KEY=<SECRET ACCESS KEY>
```

After you setup your environment variables run terraform to bootstrap the current infrastructure on AWS.

## Goals

The end goal is to fully migrate the DNS zone with all its records to Cloudflare.
