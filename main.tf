data "cloudflare_zone" "site" {
  filter = {
    name = var.domain
  }
}

resource "cloudflare_pages_project" "site" {
  account_id        = var.cloudflare_account_id
  name              = var.pages_project_name
  production_branch = "main"

  build_config = {
    build_command   = ""
    destination_dir = "public"
    root_dir        = "/"
  }

  source = {
    type = "github"
    config = {
      owner                          = "blogle"
      repo_name                      = "jeffernet"
      production_branch              = "main"
      production_deployments_enabled = true
    }
  }
}

resource "cloudflare_dns_record" "site" {
  zone_id = data.cloudflare_zone.site.id
  name    = var.domain
  type    = "CNAME"
  content = cloudflare_pages_project.site.subdomain
  ttl     = 1
  proxied = true
}

resource "cloudflare_pages_domain" "site" {
  account_id   = var.cloudflare_account_id
  project_name = cloudflare_pages_project.site.name
  name         = var.domain

  depends_on = [cloudflare_dns_record.site]
}
