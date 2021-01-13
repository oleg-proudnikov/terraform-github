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

module "java_exp" {
  source = "./modules/repo"

  name        = "java-exp"
  description = "Java experiments"
  is_private  = false
  topics = [
    "managed",
    "java",
    "basic",
  "maven"]
  template_owner = var.owner
  template_repo  = module.basic_java.name
}

module "java_networking" {
  source = "./modules/repo"

  name        = "java-networking"
  description = "Java networking experiments"
  is_private  = false
  topics = [
    "managed",
    "java",
    "basic",
  "maven"]
  template_owner = var.owner
  template_repo  = "basic-java"
}

