variable "cloudflare_account_id" {
  description = "Cloudflare account that owns the Pages project."
  type        = string
}

variable "cloudflare_zone_id" {
  description = "Cloudflare zone ID for thejeffer.net."
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
  default     = "thejeffer-net"
}
