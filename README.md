# The Jeffer Network

This repository contains the deliberately small public website for `thejeffer.net` and the OpenTofu configuration for its Cloudflare Pages hosting.

The site is intentionally static. It has no JavaScript, forms, analytics, application endpoints, worker functions, user accounts, or infrastructure inventory. Its public pages provide the basic home, privacy, and terms URLs required by external service verification.

## Contents

- `public/`: static files deployed to Cloudflare Pages
- `main.tf`: Pages project, custom domain, and apex DNS record
- `variables.tf`: deployment-specific Cloudflare identifiers
- `terraform.tfvars.example`: safe configuration example

## Local Validation

Use the repository's Nix/direnv environment, then run:

    direnv allow
    just fmt-check
    just validate

OpenTofu authentication comes from the `CLOUDFLARE_API_TOKEN` environment variable. The token must have only the Cloudflare Pages and DNS permissions needed for this project. Never place it in this repository, a tfvars file, or command output.

## Provisioning

Copy `terraform.tfvars.example` to an ignored `terraform.tfvars` and fill in the Cloudflare account and zone IDs. Confirm that `thejeffer.net` is the intended Cloudflare-managed zone before applying:

    just plan
    just apply

OpenTofu creates the Pages project, associates `thejeffer.net`, and creates the proxied apex CNAME record. It does not upload content or manage OAuth credentials.

Deploy the contents of `public/` through the Cloudflare Pages deployment mechanism configured for the project. Review the resulting public URLs before using them for Google OAuth verification:

    https://thejeffer.net
    https://thejeffer.net/privacy
    https://thejeffer.net/terms

All three URLs must return over public HTTPS without authentication. Verify domain ownership for `thejeffer.net` in the Google account used for OAuth configuration. The Google OAuth client itself remains configured manually in Google Auth Platform.

## Security Boundary

The repository exposes only general website policy and contact information. It does not contain Cloudflare tokens, Google client IDs or secrets, OAuth refresh tokens, encryption keys, API keys, private addresses, host inventories, cluster details, or links to administrative surfaces.
