workflow "Main" {
  on = "push"
  resolves = ["App Deploy"]
}

action "Deploy Branch Filter" {
  uses = "actions/bin/filter@master"
  args = ["branch", "master"]
}

action "Package Install" {
  needs = "Deploy Branch Filter"
  uses = "./.github/environment"
  args = ["install"]
}

action "App Deploy" {
  needs = "Package Install"
  uses = "./.github/environment"
  args = ["run", "deploy"]
  secrets = ["GITHUB_TOKEN"]
  env = {
    GIT_COMMITTER_NAME = "github ci"
    GIT_COMMITTER_EMAIL = "github+ci@example.com"
  }
}
