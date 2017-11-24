# Nomex

Unofficial HashiCorp Nomad Client for Elixir

This is an Elixir client for Nomad's web API found here: [https://www.nomadproject.io/api/index.html](https://www.nomadproject.io/api/index.html)

## Before You Proceed

It should be noted that this library is a simple, thin wrapper around HTTPoison (for making requests)
and Poison (for encoding/decoding JSON). I made purely for convenience.

## What Works?

As of now, all GET based JSON requests to Nomad should be working.

## What Needs to be Implemented?

1. non-GET based requests
2. non-JSON GET requests (text/plain, streaming)
3. Documentation
4. Tests

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `nomex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:nomex, "~> 0.0.1"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/nomex](https://hexdocs.pm/nomex).
