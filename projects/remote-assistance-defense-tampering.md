# Remote-Assistance to Defense-Tampering Correlation Hunt

**Status:** Designed bounded synthetic detection exercise; **not executed**.

## Objective

Correlate, on one endpoint and within a defined window: (1) remote-assistance/RMM process launch, (2) unusual PowerShell linked by ancestry, user, or session, and (3) a security-service stop, disable, or configuration change.

## Methodology

The design requires process creation, remote-assistance metadata, PowerShell 4103/4104 or equivalent, service-change events, EDR health, and off-host retention. The proposed windows are PowerShell within 10 minutes of remote assistance and security-service change within 15 minutes. Severity increases only when all three stages are present.

## False positives

Approved support can resemble the sequence. Downgrade only when the tool is approved and signed, the activity is inside a documented support/change window, ancestry and command line match procedure, and service restoration/health events are expected. Do not globally whitelist the tool.

## ATT&CK mapping

T1219 Remote Access Software; T1059.001 PowerShell; T1562.001 Impair Defenses. T1078 and T1070 are contextual only and are not findings.

## Evidence and limitations

The source record specifies required raw events, process ancestry, command lines, service initiator, generated alert, and benign-control results. None were present in the reviewed record. Therefore there is no verified detection, metric, screenshot, or successful test result to report. Pseudocode in the source is a design aid, not validated syntax.

## Original source

[Cisco Talos IR trends Q3 2026](https://blog.talosintelligence.com/ir-trends-q3-2026/), as reviewed in the linked Notion research record dated 2026-10-31.
