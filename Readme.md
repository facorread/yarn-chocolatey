# Readme for yarn-chocolatey

A [Chocolatey package] for Yarn: fast, reliable, and secure dependency management

[yarn-chocolatey] © 2022 Fabio Correa facorread@gmail.com

[yarn] © 2016-present, Yarn Contributors. All rights reserved.

## What is Chocolatey?

Chocolatey is an open-source project started by Rob Reynolds in 2011. It offers software management to the community and to businesses as well. Many volunteers contribute packages to Chocolatey that cover a wide range of applications: engineering, media production, system tools, networks, security.

## What is yarn?

Yarn is a package manager for the npm and bower registries with a few specific focuses. Yarn is a package manager for your code. It allows you to use and share (e.g. JavaScript) code with other developers from around the world. Yarn does this quickly, securely, and reliably so you don’t ever have to worry.

**Fast:** Yarn caches every package it has downloaded, so it never needs to download the same package again. It also does almost everything concurrently to maximize resource utilization. This means even faster installs.

**Reliable:** Using a detailed but concise lockfile format and a deterministic algorithm for install operations, Yarn is able to guarantee that any installation that works on one system will work exactly the same on another system.

**Secure:** Strict guarantees are placed around package installation. Yarn uses checksums to verify the integrity of every installed package before its code is executed.

## What is yarn-chocolatey?

This project provides a packaged version of yarn that can be installed, upgraded, and uninstalled via Chocolatey.

This package requires NodeJS. You can install via either the [nodejs] or [nodejs-lts] package if you do not have it installed already.

## Getting started

To install, start PowerShell (Admin) and type the following:

```powershell
choco install yarn
```

To upgrade, start PowerShell (Admin) and type either of the following:

```powershell
choco upgrade all
choco upgrade yarn
```

To uninstall, start PowerShell (Admin) and type the following:

```powershell
choco uninstall yarn
```

Visit the [Chocolatey documentation] to learn more about managing packages.

[Chocolatey documentation]:https://docs.chocolatey.org/en-us/choco/commands/
[Chocolatey package]:https://community.chocolatey.org/packages/yarn
[nodejs]:https://chocolatey.org/packages/nodejs
[nodejs-lts]:https://chocolatey.org/packages/nodejs-lts
[yarn]:https://classic.yarnpkg.com/
[yarn-chocolatey]:https://github.com/facorread/yarn-chocolatey
