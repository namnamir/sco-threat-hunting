$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$output = Join-Path $root 'references/detection-index.csv'
$rows = foreach ($file in Get-ChildItem -Path (Join-Path $root 'detections'), (Join-Path $root 'hunts') -Recurse -File -Include *.yml,*.yaml) {
    $text = Get-Content -Raw -LiteralPath $file.FullName
    $get = { param($key) ([regex]::Match($text, "(?m)^$key\s*:\s*(.+)$")).Groups[1].Value.Trim() }
    [pscustomobject]@{
        name = & $get 'name'
        id = & $get 'id'
        kind = & $get 'kind'
        use = & $get 'use'
        status = & $get 'status'
        severity = & $get 'severity'
        path = $file.FullName.Substring($root.Length + 1).Replace('\', '/')
    }
}
$rows | Export-Csv -LiteralPath $output -NoTypeInformation -Encoding utf8
Write-Output "Wrote $($rows.Count) entries to $output"
