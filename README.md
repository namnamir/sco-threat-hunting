# SOC Detection and Threat Hunting

Detection rules, alert logic, and hypothesis-driven hunts for security operations
teams. The repository focuses on practical content for Microsoft Sentinel,
Elastic, Splunk, and other SIEM platforms.

This project is intentionally **not AI-driven** and does not cover digital
forensics and incident response (DFIR). Queries are starting points: validate
field names, data quality, baselines, and response procedures in your own
environment before enabling an alert.

## Repository map

| Directory | Purpose |
| --- | --- |
| `detections/` | Alertable rules with severity, tuning, and triage guidance |
| `hunts/` | Investigations that begin with a hypothesis and produce findings |
| `data-sources/` | Collection notes and event-field references |
| `references/` | External learning resources and coverage indexes |
| `templates/` | Metadata contracts for new rules and hunts |
| `scripts/` | Local validation and index-generation helpers |

## Detection versus hunt

Use a **detection** when the logic has a defined signal, a manageable false
positive rate, and an owner who can respond to every alert. Use a **hunt** when
the question is exploratory, requires analyst context, or is intended to
establish a baseline before becoming an alert.

Every rule declares `use: soc-alert` or `use: threat-hunt` and includes the
required data source, ATT&CK mapping, triage steps, and known tuning points.

## Included examples

- Splunk: suspicious PowerShell process creation alert.
- Microsoft Sentinel: encoded or obfuscated PowerShell hunt.
- Elastic: suspicious PowerShell process execution hunt in EQL.
- Windows event ID to ATT&CK reference mapping.

## Contributing

Start with [templates/rule.yml](templates/rule.yml). Submit native queries with
the field assumptions documented, explain whether the content is an alert or a
hunt, and include false positives and triage guidance. See
[CONTRIBUTING.md](CONTRIBUTING.md).

## References

- [Awesome Cybersecurity Blue Team](https://github.com/fabacab/awesome-cybersecurity-blueteam)
- [Fundamentals of SIEM Alert Rule Development](https://academy.picussecurity.com/course/fundamentals-of-siem-alert-rule-development-course)
- [Foundations of Threat Hunting](https://academy.picussecurity.com/course/foundations-of-threat-hunting-training-free-course-certification)

## License

The original repository content is licensed under
[CC BY-NC-SA 4.0](LICENSE). Third-party material may have additional terms;
see [NOTICE.md](NOTICE.md).

