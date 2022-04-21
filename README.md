## pscan

[![goreleaser](https://github.com/zhuima/pScan/actions/workflows/goreleaser.yml/badge.svg)](https://github.com/zhuima/pScan/actions/workflows/goreleaser.yml)


pscan - short for Port Scanner - executes TCP port scan on a list of hosts






## 开发工具

vscode/go1.16/cobra/taskfile/goreleaser



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


### 如果用户设置了 .pscan.yaml 文件

```python
> pscan hosts list
> cat $HOME/.pScan.yaml
hosts-file: my.hosts

```


### 如果用户没有设置 .pscan.yaml 文件的情况， 默认读写当前目录下的主机列表文件

```python
> pscan hosts list

# 会在当前目录下生成 pscan.hosts文件
```

### 从环境变量读取或手动指定主机列表文件

```python
> PSCAN_HOSTS_FILE=newFile.hosts pscan hosts list

# 或

> pscan hosts list -f /path/to/newFile.hosts
```

### 手动指定配置文件

```python
> pscan hosts list --config /path/to/config.yaml
```



## TODO

- [ ] 支持端口区间
- [ ] 添加日志记录操作信息
- [ ] 添加preview动作来进行在线查阅帮助文档
- [x] 实现RPM包支持




