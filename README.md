## pScan

pScan - short for Port Scanner - executes TCP port scan on a list of hosts



## 开发工具

vscode/go1.16/cobra



## 快速上手

```python
❯ ./dist/pScan
pScan - short for Port Scanner - executes TCP port scan
on a list of hosts.

pScan allows you to add, list, and delete hosts from the list.
pScan executes a port scan on specified TCP ports. You can customize the
target ports using a command line flag.

Usage:
  pScan [command]

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

Use "pScan [command] --help" for more information about a command.
```



## 项目结构


```python
.
├── LICENSE
├── README.md
├── Taskfile.yml
├── cmd
│   ├── add.go
│   ├── completion.go
│   ├── delete.go
│   ├── docs.go
│   ├── hosts.go
│   ├── list.go
│   ├── root.go
│   ├── scan.go
│   └── version.go
├── config.yaml
├── go.mod
├── go.sum
├── main.go
├── newFile.hosts
├── pScan.hosts
└── scan
    ├── hostList.go
    └── scanHosts.go
```
