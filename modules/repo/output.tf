output "name" {
  value       = github_repository.this.name
  description = "A string of short repo name"
}

output "default_branch" {
  value       = github_repository.this.default_branch
  description = "Main branch"
}

output "full_name" {
  value       = github_repository.this.full_name
  description = " A string of the form \"orgname/reponame\""
}

output "html_url" {
  value       = github_repository.this.ssh_clone_url
  description = "URL to the repository on the web"
}

output "ssh_clone_url" {
  value       = github_repository.this.ssh_clone_url
  description = "URL to the repository to clone via SSH"
}

output "http_clone_url" {
  value       = github_repository.this.http_clone_url
  description = "URL to clone the repository via HTTPs"
}

output "git_clone_url" {
  value       = github_repository.this.git_clone_url
  description = "URL to clone the repository via the git protocol"
}
