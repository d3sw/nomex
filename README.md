[![Build Status](https://travis-ci.org/d3sw/nomex.svg?branch=master)](https://travis-ci.org/d3sw/nomex)

# Nomex

Unofficial HashiCorp Nomad Client for Elixir

This is an Elixir client for Nomad's web API found here: [https://www.nomadproject.io/api/index.html](https://www.nomadproject.io/api/index.html)

## Before You Proceed

It should be noted that this library is a simple, thin wrapper around HTTPoison (for making requests)
and Poison (for encoding/decoding JSON). I made this purely for convenience. If you need to interact
with only a small subset of Nomad's API, I would consider rolling your own functions.

## What Works?

As of now, all GET based JSON requests to Nomad should be working.

## What Needs to be Implemented?

1. non-GET based requests
2. non-JSON GET requests (text/plain, streaming)
3. Documentation
4. Tests

## Installation

```elixir
def deps do
  [{:nomex, "~> 0.0.3"}]
end
```

## Configuration

Currently there are two config variables. You should only need to change the nomad host:

In `config/config.exs`:

```elixir
config :nomex, nomad_host: System.get_env("NOMAD_HOST") || "http://127.0.0.1:4646"
config :nomex, nomad_version: "v1"
```

## Documentation

[https://hexdocs.pm/nomex](https://hexdocs.pm/nomex).
