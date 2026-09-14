variable "cloudflare_account_id" {
  description = "Cloudflare account that owns the Pages project."
  type        = string
}

variable "domain" {
  description = "Public apex domain for the static site."
  type        = string
  default     = "thejeffer.net"
}

variable "pages_project_name" {
  description = "Cloudflare Pages project name."
  type        = string
  default     = "jeffernet"
}

variable "google_site_verification_token" {
  description = "Exact google-site-verification TXT value supplied by Google; leave empty until received."
  type        = string
  sensitive   = true
  default     = ""
}
