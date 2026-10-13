$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$files = Get-ChildItem -Path $root -Recurse -File -Include *.yml,*.yaml
$ids = @{}
$errors = [System.Collections.Generic.List[string]]::new()

foreach ($file in $files) {
    $text = Get-Content -Raw -LiteralPath $file.FullName
    foreach ($field in @('name:', 'id:', 'kind:', 'use:', 'description:', 'query:')) {
        if ($text -notmatch "(?m)^$([regex]::Escape($field))") {
            $errors.Add("$($file.FullName): missing $field")
        }
    }
    if ($text -match '(?i)(generated password|password is\s*:\s*[A-Za-z0-9])') {
        $errors.Add("$($file.FullName): possible credential material")
    }
    $match = [regex]::Match($text, '(?m)^id:\s*([^\s#]+)')
    if ($match.Success) {
        $id = $match.Groups[1].Value
        if ($ids.ContainsKey($id)) {
            $errors.Add("duplicate id $id in $($file.Name) and $($ids[$id])")
        } else {
            $ids[$id] = $file.Name
        }
    }
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Output "Validated $($files.Count) metadata files; $($ids.Count) unique IDs found."
