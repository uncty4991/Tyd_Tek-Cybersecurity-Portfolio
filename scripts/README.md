# Code inventory and provenance

This directory contains only code that is safe to publish and accurately labeled.

## Included

- `Invoke-OllamaExposureAudit.ps1`: a portfolio-safe read-only reference implementation based on the documented purpose of the missing `Tyd_Tek_Ollama_Exposure_Audit.ps1`. It inventories local listeners, owning processes, firewall profiles/rules, and local IPv4 addresses. It does not scan externally or change configuration.
  - Provenance: reconstructed from the Notion description; **not the original recovered file**.
  - Verification: not executed in this workspace; treat output as unverified until run locally.

## Documented but not available for publication

- `Tyd_Tek_Ollama_Exposure_Audit.ps1`: source file is referenced in Notion/ChatGPT file history, but the actual file was not available in the connected workspace.
- Synthetic Zimbra process-tree lab scripts: the Notion record says starter files existed in a prior ChatGPT conversation, but the archive and scripts were not available here.
- OT asset integrity scripts: the Notion record documents `01-Initialize.ps1`, `02-SimulateChange.ps1`, and `03-Hunt.ps1`, but their actual contents were not available here.
- Suricata rule and alert logs: execution was explicitly unverified, so no rule or result was reconstructed.

## Excluded

Sample malware, Rubber Ducky/Digispark payloads, defense-disable or persistence examples, credential/network-export behavior, private telemetry, suspicious links, and any code whose provenance or safety could not be established.

## What would make more code publishable

Provide the original files or archives for review. Each candidate should be sanitized, tested only in an authorized isolated lab, and labeled with provenance, execution status, inputs, outputs, limitations, and safety boundaries.
