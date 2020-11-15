variable "name" {
  description = "Repository name, lower case letters and dashes"
  type = string
}

variable "description" {
  description = "Short free form repo depository"
  type = string
}

variable "topics" {
  description = "Tags used to classify repositories"
  type = set(string)
}

variable "is_private" {
  description = "Is this a private repository?"
  type = bool
  default = true
}

variable "is_template" {
  description = "Is this a template repository?"
  type = bool
  default = false
}

variable "template_owner" {
  description = "Template repository owner"
  type = string
  default = ""
}

variable "template_repo" {
  description = "Template repository"
  type = string
  default = ""
}

variable "is_strict" {
  description = "Require branch to be up to date before merge"
  type = bool
  default = false
}

variable "is_branch_protected" {
  description = "Is main branch protected?"
  type = bool
  default = true
}
