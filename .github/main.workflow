workflow "Main" {
  on = "push"
  resolves = ["App Deploy"]
}

action "Package Install" {
  uses = "./.github/environment"
  args = ["install"]
}

action "Deploy Branch Filter" {
  needs = "Package Install"
  uses = "actions/bin/filter@master"
  args = ["branch", "master"]
}

action "App Deploy" {
  needs = "Deploy Branch Filter"
  uses = "./.github/environment"
  args = ["run", "deploy"]
}
