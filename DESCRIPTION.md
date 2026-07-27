
---

### Looking for the GUI version? Check out the [green-tunnel-gui](https://community.chocolatey.org/packages/green-tunnel-gui) package

---

## Green Tunnel

Green Tunnel is an anti-censorship utility, implemented as a local proxy server, that is intended to subvert malicious Deep Packet Inspection (DPI) systems. These may be configured by some Internet Service Providers (ISPs) to block access to certain websites.

### Usage Statement

```shell
Usage: gt [options]
Server
  --host <ip>              Address to bind          (default: 127.0.0.1)
  -p, --port <n>           Port to bind, 0 = random (default: 8000)
  --https-only             Reject plain HTTP requests
Fragmentation
  --no-fragment            Forward the ClientHello untouched
  --fragment-size <n>      Bytes per piece          (default: 40)
  --tls-records            Re-frame pieces as valid TLS records
  --fragment-delay <ms>    Pause between pieces     (default: 0)
DNS
  --dns <mode>             doh | dot | plain        (default: doh)
  --doh-url <url>          DoH endpoint             (default: Cloudflare)
  --dot-host <host>        DoT server               (default: 1.1.1.1)
  --dot-port <n>           DoT port                 (default: 853)
  --dns-server <ip>        Plain resolver, repeatable
  --family <pref>          ipv4 | ipv6 | ipv4-first | ipv6-first
Other
  --no-system-proxy        Do not touch the OS proxy settings
  --log-level <level>      silent | error | warn | info | debug | trace
  -q, --quiet              No banner, no logs
  -h, --help               Show this help
  -V, --version            Show the version
```

## Package Notes

While Green Tunnel is theoretically embeddable from a licensing perspective, it is deliberately sourced from the npm Registry to ensure dependencies are correctly managed and comply with Community Repository policies that prevent repackaging of relevant modules. If you need to [internalize this package](https://docs.chocolatey.org/en-us/guides/create/recompile-packages), follow [this guide](http://www.leanpro.cn/docs/leanrunner/en/shared/npm_offline) to prepare an archive for offline installation.

---

While the package is being installed, you may see some messages logged to `stderr`, including warnings relating to deprecated package dependencies, or notice messages if `npm` itself is outdated. Note that these are not necessarily indicative of an error condition with the Chocolatey package. Therefore, you should ensure the `failOnStandardError` feature is disabled while installing/upgrading this package.
