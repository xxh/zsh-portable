| Note! The best version was created in https://github.com/romkatv/zsh-bin/ - use it fisrt. |
|---|

The docker containers to build portable zsh. Originally created for [xxh project](https://github.com/xxh/xxh).

## Building
### libc
```shell script
./build-zsh-portable-libc-ubuntu.sh
ls -la ./result
```

### musl
```
./build-zsh-portable-musl-alpine.sh
```
Version with relative lib path: 
```
./build-zsh-portable-musl-alpine-portable.sh
```

## Example
```
mkdir -p /tmp/zsh-portable
cp ./result/* /tmp/zsh-portable 
cd /tmp/zsh-portable && tar -xvzf zsh-portable-musl-alpine-portable-Linux-x86_64.tar.gz
./zsh.sh
```

## Related
* [zsh.org / Portable rootless ZSH](https://www.zsh.org/mla/workers/2019/msg00866.html)
