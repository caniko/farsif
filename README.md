# FRSF: Federated Real-Time State Fabric

FRSF is a proposed open protocol and Rust implementation for application state
that must move between independently operated hosts. It makes the contract for
each state box explicit: authority, ordering, replication, visibility,
retention, reconciliation, and freshness.

This repository is the public project surface and initial design record. The
implementation is not yet released; planned work will publish the protocol,
reference kernel, conformance vectors, reproducible Nix/NixOS deployment, and
fault-injection tests as they become available.

## Project links

- Project page: <https://frsf.caniko.codefloe.page>
- Canonical repository: <https://codefloe.com/caniko/frsf>
- GitHub mirror: <https://github.com/caniko/frsf>

## Design direction

- Applications submit signed transitions to typed state boxes.
- Deterministic reducers produce committed state roots and projections.
- Relays deliver only the representation allowed by each state profile.
- Operators can inspect replayable history, receipts, checkpoints, and
  recovery boundaries.
- Reproducible Nix/NixOS roles make multi-host experiments inspectable.

FRSF is not presented as a replacement for every database, a global ledger, or
an existing federation project. The first implementation will be evaluated by
replay, conformance, failure, recovery, and resource-bound tests.

## Status and contribution boundary

The current status is proposal / pre-implementation. Do not interpret the
planned work as a released prototype, production deployment, adoption claim,
security audit, partnership, or endorsement.

Issues and design feedback are welcome on the canonical repository. Please
keep proposed protocol changes tied to a reproducible example or acceptance
criterion.

## License

Unless a file states otherwise, this repository is released under the Apache
License, Version 2.0. See [LICENSE](LICENSE).
