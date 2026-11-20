# Synthetic PHP2Shell to Root Correlation Hunt

**Status:** Prepared proposed lab; **not executed in the user VM**.

## Objective

Design a three-stage, read-only correlation for a suspicious PHP management POST, a web-service child shell, and a root-privilege event on the same host within 10 minutes. This is a hunt hypothesis, not proof of exploitation or a CVE finding.

## Methodology

The prepared workflow reads a synthetic CSV in an isolated, network-disabled or host-only VM and exports `evidence_findings.csv`. The intended positive control is `fw-mgmt-01`; benign/incomplete controls are `fw-mgmt-02` and `fw-mgmt-03`, as specified by the source record.

## False-positive and false-negative considerations

Legitimate web administration can produce management POSTs and child processes. Missing telemetry, clock skew, incomplete ancestry, or a >10-minute delay can hide a chain. Any result should remain an investigation lead until corroborated.

## Evidence boundary

The record lists expected CSV output, a redacted screenshot, an experimental Sigma rule, README, and completed evidence notes, but none were available as verified execution artifacts. I therefore report no successful detection, counts, screenshots, or measured outcome.

## Original source

[Unit 42 PHP2Shell research](https://unit42.paloaltonetworks.com/cve-2026-109618-cve-2026-109619/), referenced by the Notion preparation record dated 2026-10-30.
