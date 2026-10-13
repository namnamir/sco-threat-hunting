# Contributing

This repository contains practical SOC detection and threat-hunting content. It
is not an AI project and it does not cover DFIR.

## Before opening a pull request

- Use `templates/rule.yml` as the metadata baseline.
- State whether the content is `soc-alert` or `threat-hunt`.
- Include a complete query and name the expected data source and fields.
- Map behavior to valid MITRE ATT&CK technique IDs.
- Document false positives, tuning assumptions, and analyst triage steps.
- Do not include credentials, customer data, raw logs, malware, or proprietary content.
- Credit upstream work and record its license in the rule metadata and `NOTICE.md`.

## Alert quality

An alert should have a clear signal, a severity, a response owner, and a
reasonable path to reduce false positives. Exploratory logic belongs in a hunt
until it has been baselined.

## Query conventions

Keep native queries in the platform directory. Use lowercase metadata keys,
stable UUIDs, ISO dates, and ASCII text. Prefer explicit field names over broad
free-text searches. Test queries against representative data before submitting.

## License

By contributing, you agree that your contribution is provided under the
repository's CC BY-NC-SA 4.0 license unless a file states an applicable
third-party license.
