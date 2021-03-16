terraform {
  backend "remote" {
    organization = "tfe-cli-example"

    workspaces {
      name = "tfe-cli"
    }
  }
}