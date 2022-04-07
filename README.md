## pscan

[![goreleaser](https://github.com/zhuima/pScan/actions/workflows/goreleaser.yml/badge.svg)](https://github.com/zhuima/pScan/actions/workflows/goreleaser.yml)

pscan - short for Port Scanner - executes TCP port scan on a list of hosts






## 开发工具

vscode/go1.16/cobra



## 安装

### Homebrew

```python
brew tap zhuima/pscan https://github.com/zhuima/pScan
brew install pscan
pscan
```

### 快速上手

```python
❯ pscan
pscan - short for Port Scanner - executes TCP port scan
on a list of hosts.

pscan allows you to add, list, and delete hosts from the list.
pScan executes a port scan on specified TCP ports. You can customize the
target ports using a command line flag.

Usage:
  pscan [command]

Available Commands:
  completion  Generate bash completion scripts
  docs        Generate documentation for your command
  help        Help about any command
  hosts       Manage the hosts list
  scan        Run a port scan on the hosts
  version     A brief description of your command

Flags:
      --config string       config file (default is $HOME/.pScan.yaml)
  -h, --help                help for pScan
  -f, --hosts-file string   pScan hosts file (default "pScan.hosts")
  -t, --toggle              Help message for toggle

Use "pcan [command] --help" for more information about a command.
```



## TODO

- [ ] 支持端口区间
- [ ] 添加日志记录操作信息
- [ ] 添加preview动作来进行在线查阅帮助文档
- [ ] 实现RPM包支持




