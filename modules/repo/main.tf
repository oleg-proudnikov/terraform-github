resource "github_repository" "this" {
  name = var.name
  description = var.description

  default_branch = "main"

  visibility = var.is_private ? "private" : "public"
  is_template = var.is_template
  has_wiki = true
  has_issues = true
  auto_init = true
  allow_merge_commit = false
  allow_rebase_merge = false
  allow_squash_merge = true
  delete_branch_on_merge = true
  topics = var.topics

  dynamic "template" {
    for_each = var.template_repo == "" ? [] : [
      1]
    content {
      owner = var.template_owner
      repository = var.template_repo
    }
  }
}

resource "github_branch_protection" "this" {
  count = var.is_branch_protected ? 1 : 0

  repository_id = github_repository.this.node_id
  pattern = github_repository.this.default_branch

  required_pull_request_reviews {
    dismiss_stale_reviews = false
    require_code_owner_reviews = true
    required_approving_review_count = 1
  }
}
