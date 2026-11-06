# Security Policy

This repository contains **lab documentation** (a Docsify site). It does not ship a
running service or product. Still, we take security of the content and examples
seriously — for instance, keeping secrets out of pages and screenshots.

## Reporting a vulnerability or exposure

Please report privately rather than opening a public issue, especially for anything
involving leaked credentials, tokens, internal URLs, or personal data in the content
or its history.

> **Maintainer note (publication blocker):** add an approved private reporting
> channel before public release — for example GitHub's **private vulnerability
> reporting** for this repository, or a monitored maintainer security contact. **Do
> not** publish an unverified F5 security-reporting email or portal here.

When reporting, please include:

- The affected page, file, or screenshot (path or URL).
- A description of the exposure and why it is sensitive.
- If it is leaked material, **do not** paste the secret itself — describe it and its
  location so maintainers can rotate/redact it.

## What to expect

- Maintainers will acknowledge the report and assess it privately.
- If a secret was committed at any point, maintainers may need to **redact the
  content, rotate the affected credential, and clean Git history** before publication.

## Scope

In scope: secrets or personal data in documentation content, screenshots, or repo
history; links that leak internal infrastructure details.

Out of scope: the security of the WAIS product, the UDF Blueprint, or the tenant
provisioning service — those are owned and supported separately and are not part of
this documentation repository.
