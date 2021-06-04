# NetScanCLI

**Simple scanner in bash**

---

**Run**
```cmd
root@kali:~# netscan <host>
```

**Download / Install**
```cmd
root@kali:~# wget "https://raw.githubusercontent.com/d4t4s3c/NetScanCLI/main/netscan.sh" -O /opt/netscan.sh
root@kali:~# chmod +x /opt/netscan.sh
```

**Add Alias**

- Bash --------> `root@kali:~# echo "alias netscan='/opt/netscan.sh'" >> /root/.bashrc`
- Zsh ---------> `root@kali:~# echo "alias netscan='/opt/netscan.sh'" >> /root/.zshrc`
- Powerlevel --> `root@kali:~# echo "alias netscan='/opt/netscan.sh'" >> /root/.p10k.zsh`

(Close terminal and reopen again)

**Info**

(Check: TTL - OS - (1-65535) Open Ports & Nmap Version Detection & Nmap Script Default)

---

**Linux**

![](/1.png)

**Windows**

![](/2.png)

---
