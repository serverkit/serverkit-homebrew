# Serverkit::Homebrew
[Serverkit](https://github.com/r7kamura/serverkit) plug-in for [Homebrew](http://brew.sh/).

## Installation
```rb
gem "serverkit-homebrew"
```

## Resource
### homebrew_package
Make sure the specified homebrew package is installed.

#### Attributes
- name - package name (required)
- options - command-line-options for installation (e.g. `"--HEAD"`)

#### Example
```yaml
resources:
  - type: homebrew_package
    name: zsh
  - type: homebrew_package
    name: rbenv
    options: --HEAD
```

### homebrew_cask_package
Make sure the specified homebrew cask package is installed.

#### Attributes
- name - package name (required)
- options - command-line-options for installation

#### Example
```yaml
resources:
  - type: homebrew_cask_package
    name: karabiner
  - type: homebrew_cask_package
    name: vagrant
```

### homebrew_tap
Make sure the specified GitHub repo is tapped (or untapped).

#### Attributes
- name - repository name (required)
- options - command-line-options for `brew tap` and `brew untap`
- status - pass `"untapped"` to make sure the repo is untapped

#### Example
```yaml
resources:
  - type: homebrew_tap
    name: caskroom/cask
  - type: homebrew_tap
    name: homebrew/versions
    status: untapped
```
