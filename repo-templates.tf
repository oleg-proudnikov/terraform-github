module "basic_repo" {
  source = "./modules/repo"

  name                = "basic-repo"
  description         = "Common content for all repositories"
  is_private          = false
  is_template         = true
  is_strict           = false
  is_branch_protected = false
  topics = [
    "managed",
  "github"]
}

module "basic_java" {
  source = "./modules/repo"

  name        = "basic-java"
  description = "Basic Java project with Maven, Mockito, JUnit 5"
  is_private  = false
  is_template = true
  topics = [
    "managed",
    "java",
    "junit5",
  "maven"]
  template_owner = var.owner
  template_repo  = module.basic_repo.name
}

module "java_spring" {
  source = "./modules/repo"

  name        = "java-spring"
  description = "Basic Java Spring 2 project with Maven, Mockito, JUnit 5"
  is_private  = false
  is_template = true
  topics = [
    "managed",
    "java",
    "spring",
    "lombok",
    "junit5",
  "maven"]
  template_owner = var.owner
  template_repo  = module.basic_java.name
}

module "java_spring_kafka" {
  source = "./modules/repo"

  name        = "java-spring-kafka"
  description = "Basic Java Spring 2 project with Kafka"
  is_private  = false
  is_template = true
  topics = [
    "managed",
    "java",
    "spring",
    "lombok",
    "kafka",
    "junit5",
  "maven"]
  template_owner = var.owner
  template_repo  = module.java_spring.name
}

resource "github_repository_file" "basic_repo_gitignore" {
  repository = module.basic_repo.name
  file       = ".gitignore"
  content    = file("./files/.gitignore")

  commit_message      = "Managed by Terraform"
  overwrite_on_create = true
}

resource "github_repository_file" "basic_repo_readme" {
  repository = module.basic_repo.name
  file       = "README.md"
  content    = file("./files/README.md")

  commit_message      = "Managed by Terraform"
  overwrite_on_create = true
}

resource "github_repository_file" "basic_repo_codeowners" {
  repository = module.basic_repo.name
  file       = ".github/CODEOWNERS"
  content    = file("./files/CODEOWNERS")

  commit_message      = "Managed by Terraform"
  overwrite_on_create = true
}

# Java files
resource "github_repository_file" "basic_java_pom" {
  repository = module.basic_java.name
  file       = "pom.xml"
  content    = file("./files/java/basic/pom.xml")

  commit_message      = "Managed by Terraform"
  overwrite_on_create = true
}
resource "github_repository_file" "basic_java_main" {
  repository = module.basic_java.name
  file       = "src/main/java/dev/oleg/App.java"
  content    = file("./files/java/basic/src/main/java/dev/oleg/App.java")

  commit_message      = "Managed by Terraform"
  overwrite_on_create = true
}
resource "github_repository_file" "basic_java_test" {
  repository = module.basic_java.name
  file       = "src/test/java/dev/oleg/AppTest.java"
  content    = file("./files/java/basic/src/test/java/dev/oleg/AppTest.java")

  commit_message      = "Managed by Terraform"
  overwrite_on_create = true
}
