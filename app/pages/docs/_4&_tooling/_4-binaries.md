---
title: Binaries
published: true
---

Each [GitHub release](https://github.com/raindeer-rb/raindown/releases) has a standalone `raindown` executable for macOS, Linux (glibc and musl) and Windows, built with [Tebako](https://github.com/tamatebako/tebako). Ruby is bundled inside, so nothing else needs to be installed.

## Building your own

To build one for your own machine, [install Tebako](https://github.com/tamatebako/tebako#installation) and run:

```shell
bundle exec rake tebako  # writes pkg/raindown-<version>-<platform>
```
