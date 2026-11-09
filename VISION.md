# Farsif vision

Farsif is a proposed open protocol, with a planned Rust implementation, for
application state that moves between independently operated hosts. Each state
box would declare its authority, ordering, replication, visibility, retention,
reconciliation, and freshness rules instead of leaving them implicit. The
repository today is the project surface and design record: a README, a public
project site, and the surrounding Nix tooling. It is explicitly
pre-implementation.

## Problem

State shared across separately operated hosts usually relies on an undocumented
global write path. Applications and operators cannot point at a contract that
says who may write, in what order, what a peer is allowed to see, how long data
is retained, and what "fresh" means for a given box.

## Principles

- Make the contract for each state box explicit rather than implicit in an
  application's database usage.
- Applications submit signed, typed transitions instead of using a shared
  bypass channel.
- Deterministic reducers produce committed state roots and projections, so
  replay is meaningful.
- Relays deliver only the representation each profile permits; freshness and
  resource bounds are protocol concerns.
- Recovery is inspectable: replayable history, receipts, checkpoints, and
  recovery boundaries are part of the design.
- Reproducible Nix/NixOS roles make multi-host experiments rebuildable.
- Publication stays honest: the project page and README mark planned artifacts
  as planned and make no production, adoption, audit, or performance claims.

## Scope

The design record and project site — protocol vocabulary (state boxes,
transitions, profiles, reducers, relays), the intended acceptance model, and the
flake that builds the site. The README states that the protocol, reference
kernel, conformance vectors, reproducible deployment roles, and fault-injection
tests will be published as they become available.

## Non-goals

Farsif is not presented as a replacement for every database, as a global
ledger, or as an existing federation project. The current repository is not a
released prototype, production deployment, security audit, partnership, or
endorsement, and it does not claim those.

## Direction

The stated direction is to evaluate the first implementation by replay,
conformance, failure, recovery, and resource-bound tests, and to tie proposed
protocol changes to a reproducible example or acceptance criterion. No dated
roadmap exists; the only tracked work in this checkout has been the project
site and Nix input maintenance.
