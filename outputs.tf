output "pages_project_name" {
  description = "Cloudflare Pages project name."
  value       = cloudflare_pages_project.site.name
}

output "pages_subdomain" {
  description = "Cloudflare-managed Pages subdomain."
  value       = cloudflare_pages_project.site.subdomain
}

output "public_homepage_url" {
  description = "Public static homepage URL."
  value       = "https://${var.domain}"
}

output "public_privacy_url" {
  description = "Public privacy policy URL for service verification."
  value       = "https://${var.domain}/privacy"
}

output "public_terms_url" {
  description = "Public terms URL."
  value       = "https://${var.domain}/terms"
}
