# Cisco Talos Help-Desk Vishing and EDR Tampering Research

**Status:** Research review; **not a personal incident investigation** and not a verified production detection.

## What was reviewed

The Notion research record summarizes Cisco Talos's Q3 2026 incident-response trends: phishing, public-facing exploitation, ransomware/pre-ransomware, help-desk impersonation, Quick Assist/RMM access, EDR tampering, and logging gaps. The percentages are Talos engagement-sample figures and must not be generalized as global prevalence.

## Defensive implications

The research supports prioritizing process creation, remote-assistance/RMM use, security-service changes, sensor health, and centralized log retention. The companion project in this repository converts that hypothesis into a bounded synthetic design.

## AI-assisted triage boundary

The reviewed Notion material also contains a planned localhost-only Suricata/Ollama triage workflow. Its own audit says the alert file, model response, screenshot, and human validation were not evidenced. It is not presented as completed work or as a successful detection.

## Limitations and source discipline

This page records a source review, not hands-on access to Talos cases, a victim environment, or production telemetry. No victim identifiers, private records, suspicious URLs, or unredacted artifacts are published.

## Original source

[Cisco Talos IR trends Q3 2026](https://blog.talosintelligence.com/ir-trends-q3-2026/), published 2026-10-29 and reviewed in the Notion record dated 2026-10-31.
