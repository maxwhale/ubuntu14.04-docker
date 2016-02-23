# Ubuntu14.04-Docker

Ubuntu verison: 14.04 (64bit)

Root password: LNMP123

## Usage

```docker pull registry.aliyuncs.com/max/ubuntu14.04-docker```

```docker run --restart=always -P -ti --name CentOS registry.aliyuncs.com/max/ubuntu14.04-docker ./run.sh```

```docker run --restart=always -p 30000:80 -p 30001:21 -p 30002:22 -p 30003:3306 -p 30004:6379 -p 30005:11211 -ti --name CentOS registry.aliyuncs.com/max/ubuntu14.04-docker ./run.sh```