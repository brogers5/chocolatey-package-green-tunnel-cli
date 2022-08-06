
---
### [choco://green-tunnel-cli](choco://green-tunnel-cli)
To use choco:// protocol URLs, install [(unofficial) choco:// Protocol support](https://community.chocolatey.org/packages/choco-protocol-support)

---

### Looking for the GUI version? Check out the [green-tunnel-gui](https://community.chocolatey.org/packages/green-tunnel-gui) package!

---

## Green Tunnel

Green Tunnel is an anti-censorship utility, implemented as a local proxy server, that is intended to subvert malicious Deep Packet Inspection (DPI) systems. These may be configured by some Internet Service Providers (ISPs) to block access to certain websites.

### Usage Statement

```shell
Usage: green-tunnel [options]
Usage: gt [options]

Options:
  --help, -h      Show help                                            [boolean]
  --version, -V   Show version number                                  [boolean]
  --ip            ip address to bind proxy server[string] [default: "127.0.0.1"]
  --port          port address to bind proxy server     [number] [default: 8000]
  --https-only    Block insecure HTTP requests        [boolean] [default: false]
  --dns-type[string] [choices: "https", "tls", "unencrypted"] [default: "https"]
  --dns-server        [string] [default: "https://cloudflare-dns.com/dns-query"]
  --dns-ip                                       [string] [default: "127.0.0.1"]
  --dns-port                                              [number] [default: 53]
  --silent, -s    run in silent mode                  [boolean] [default: false]
  --verbose, -v   debug mode                              [string] [default: ""]
  --system-proxy  automatic set system-proxy           [boolean] [default: true]

Examples:
  gt
  gt --ip 127.0.0.1 --port 8000
  gt --dns-server https://doh.securedns.eu/dns-query
```

## Package Notes

While Green Tunnel is theoretically embeddable from a licensing perspective, it is deliberately sourced from the npm Registry to ensure dependencies are correctly managed and comply with Community Repository policies that prevent repackaging of relevant modules. If you need to [internalize this package](https://docs.chocolatey.org/en-us/guides/create/recompile-packages), follow [this guide](http://www.leanpro.cn/docs/leanrunner/en/shared/npm_offline) to prepare an archive for offline installation. 

---

While the package is being installed, you may see some messages logged to `stderr`, including warnings relating to deprecated package dependencies, or notice messages if `npm` itself is outdated. Note that these are not necessarily indicative of an error condition with the Chocolatey package. Therefore, you should ensure the `failOnStandardError` feature is disabled while installing/upgrading this package.
