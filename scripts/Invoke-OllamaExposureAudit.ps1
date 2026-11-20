<#
.SYNOPSIS
  Read-only local exposure inventory for Ollama-style services.

.DESCRIPTION
  Portfolio-safe reference implementation reconstructed from a documented project
  description. It inventories local TCP listeners, owning processes, firewall
  profiles/rules, and local IPv4 addresses. It makes no network connections,
  firewall changes, router changes, or other system modifications.

.NOTES
  Reconstructed reference implementation; not the original Tyd_Tek source file.
  Run only on systems you own or are authorized to assess.
#>
[CmdletBinding()]
param(
  [int[]]$Ports = @(11434, 3001),
  [string]$OutputPath = (Join-Path $env:USERPROFILE ("Desktop\Tyd_Tek_Ollama_Exposure_Audit_{0}.md" -f (Get-Date -Format "yyyyMMdd_HHmmss")))
)

$ErrorActionPreference = "Stop"
$rows = @()
foreach ($port in $Ports) {
  $listeners = Get-NetTCPConnection -State Listen -LocalPort $port -ErrorAction SilentlyContinue
  foreach ($listener in $listeners) {
    $process = Get-Process -Id $listener.OwningProcess -ErrorAction SilentlyContinue
    $rows += [pscustomobject]@{
      Port = $port
      LocalAddress = $listener.LocalAddress
      OwningProcess = $listener.OwningProcess
      ProcessName = $process.ProcessName
      Path = $process.Path
    }
  }
}

$profiles = Get-NetFirewallProfile |
  Select-Object Name, Enabled, DefaultInboundAction, DefaultOutboundAction

$rules = Get-NetFirewallRule -Enabled True -Direction Inbound -Action Allow |
  ForEach-Object {
    $portFilter = $_ | Get-NetFirewallPortFilter -ErrorAction SilentlyContinue
    [pscustomobject]@{
      DisplayName = $_.DisplayName
      Profile = $_.Profile
      Protocol = $portFilter.Protocol
      LocalPort = $portFilter.LocalPort
      Program = $_.Program
    }
  }

$addresses = Get-NetIPAddress -AddressFamily IPv4 |
  Where-Object { $_.IPAddress -notlike "127.*" } |
  Select-Object InterfaceAlias, IPAddress, PrefixLength, AddressState

$lines = @(
  "# Tyd_Tek Ollama Exposure Audit"
  ""
  "Generated: $(Get-Date -Format o)"
  ""
  "## Scope and safety"
  ""
  "Read-only local inventory. No external scans, firewall changes, router changes, or configuration changes were performed."
  ""
  "## Matching local listeners"
  ""
  ($rows | Format-Table -AutoSize | Out-String).TrimEnd()
  ""
  "## Firewall profiles"
  ""
  ($profiles | Format-Table -AutoSize | Out-String).TrimEnd()
  ""
  "## Enabled inbound allow rules"
  ""
  ($rules | Format-Table -AutoSize | Out-String).TrimEnd()
  ""
  "## Local IPv4 addresses"
  ""
  ($addresses | Format-Table -AutoSize | Out-String).TrimEnd()
  ""
  "## Review notes"
  ""
  "- A listener is not proof of unsafe exposure; verify bind address, authentication, firewall scope, and intended use."
  "- Redact local IP addresses, usernames, process paths, and host identifiers before sharing output."
  "- This script does not test reachability from another host."
)
$lines | Set-Content -LiteralPath $OutputPath -Encoding UTF8
Write-Output "Wrote $OutputPath"
