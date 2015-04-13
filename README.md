# serverkit-homebrew
[Serverkit](https://github.com/r7kamura/serverkit) plug-in for [Homebrew](http://brew.sh/).

- [Installation](#installation)
- [Resource](#resource)
  - [homebrew_package](#homebrew_package)
    - [Attributes](#attributes)
    - [Example](#example)
  - [homebrew_cask_package](#homebrew_cask_package)
    - [Attributes](#attributes-1)
    - [Example](#example-1)
  - [homebrew_tap](#homebrew_tap)
    - [Attributes](#attributes-2)
    - [Example](#example-2)

## Install
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
- state - pass `"untapped"` to make sure the repo is untapped

#### Example
```yaml
resources:
  - type: homebrew_tap
    name: caskroom/cask
  - type: homebrew_tap
    name: homebrew/versions
    state: untapped
```
