module "terraform_github" {
  source = "./modules/repo"

  name        = "terraform-github"
  description = "My personal GitHub"
  is_private  = false
  topics = [
    "managed",
    "terraform",
  "github"]
  template_owner = var.owner
  template_repo  = module.basic_repo.name
}

