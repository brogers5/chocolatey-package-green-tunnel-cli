# <img src="https://cdn.jsdelivr.net/gh/brogers5/chocolatey-package-green-tunnel-cli@45b1b102bf3a1836a63a043845506e4ca2c774c6/green-tunnel-cli.png" width="48" height="48"/> Chocolatey Package: [Green Tunnel (CLI)](https://community.chocolatey.org/packages/green-tunnel-cli)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/green-tunnel-cli.svg)](https://community.chocolatey.org/packages/green-tunnel-cli)
[![Chocolatey package download count](https://img.shields.io/chocolatey/dt/green-tunnel-cli.svg)](https://community.chocolatey.org/packages/green-tunnel-cli)

## Install
[Install Chocolatey](https://chocolatey.org/install), and run the following command to install the latest approved version on the Chocolatey Community Repository:
```shell
choco install green-tunnel-cli
```

Alternatively, the packages as published on the Chocolatey Community Repository will also be mirrored on this repository's [Releases page](https://github.com/brogers5/chocolatey-package-green-tunnel-cli/releases). The `nupkg` can be installed from the current directory as follows:

```shell
choco install green-tunnel-cli -s .
```

## Build
[Install Chocolatey](https://chocolatey.org/install), clone this repository, and run the following command in the cloned repository:
```shell
choco pack
```

A successful build will create `green-tunnel-cli.x.y.z.nupkg`, where `x.y.z` should be the Nuspec's `version` value at build time.

Note that Chocolatey package builds are non-deterministic. Consequently, an independently built package will fail a checksum validation against officially published packages.

## Update
This package should be automatically updated by the [Chocolatey Automatic Package Updater Module](https://github.com/majkinetor/au). If it is outdated by more than a few days, please [open an issue](https://github.com/brogers5/chocolatey-package-green-tunnel-cli/issues).

AU expects the parent directory that contains this repository to share a name with the Nuspec (`green-tunnel-cli`). Your local repository should therefore be cloned accordingly:
```shell
git clone git@github.com:brogers5/chocolatey-package-green-tunnel-cli.git green-tunnel-cli
```

Alternatively, a junction point can be created that points to the local repository (preferably within a repository adopting the [AU packages template](https://github.com/majkinetor/au-packages-template)):
```shell
mklink /J green-tunnel-cli ..\chocolatey-package-green-tunnel-cli
```

Once created, simply run `update.ps1` from within the created directory/junction point. Assuming all goes well, all relevant files should change to reflect the latest version available. This will also build a new package version using the modified files.

Before submitting a pull request, please [test the package](https://docs.chocolatey.org/en-us/community-repository/moderation/package-verifier#steps-for-each-package) using the [Chocolatey Testing Environment](https://github.com/chocolatey-community/chocolatey-test-environment) first.
