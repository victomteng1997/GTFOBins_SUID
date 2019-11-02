#!/bin/bash
suid_check()
{
#standard GTFOs
declare -a array=("make" "cp" "rlwrap" "vim" "tclsh" "cut" "tftp" "openssl" "rvim" "cpulimit" "journalctl" "perl" "aria2c" "timeout" "mail" "dash" "mtr" "ssh" "node" ".dir-locals.el" "grep" "screen" "emacs" "fmt" "smbclient" "awk" "od" "tcpdump" "sftp" "tmux" "ionice" "git" "rpmquery" "flock" "curl" "base64" "pic" "lua" "logsave" "cancel" "ed" "shuf" "script" "rpm" "telnet" "facter" "irb" "socat" "tail" "expect" "time" "apt" "scp" "mount" "nano" "watch" "taskset" "start-stop-daemon" "ruby" "zip" "apt-get" "wget" "ftp" "mysql" "mv" "ldconfig" "diff" "dnf" "xxd" "ld.so" "pico" "gawk" "fold" "sed" "sqlite3" "dmsetup" "arp" "zypper" "cat" "run-parts" "dd" "run-mailcap" "rlogin" "jrunscript" "strace" "vi" "find" "file" "easy_install" "rsync" "gdb" "tee" "nice" "expand" "zsh" "bash" "ash" "ul" "puppet" "iftop" "busybox" "mawk" "uniq" "wish" "head" "systemctl" "csh" "unshare" "whois" "readelf" "yum" "nawk" "date" "finger" "cpan" "less" "nl" "chmod" "python" "nc" "more" "dmesg" "dpkg" "unexpand" "jjs" "pg" "ksh" "man" "crontab" "chown" "xargs" "docker" "nmap" "sort" "gimp" "php" "tar" "ip" "env" "pip" "jq" "stdbuf" "red" "service" "setarch" "ltrace")

#specific checks - any sticky bits 
echo -e "Find suid executables" 
suid_var=$(find / -perm -u=s -type f 2>/dev/null)

for line in $suid_var; do
 exec_name=${line##*/}
 if [[ " ${array[*]} " == *$exec_name* ]]; then
    echo "$exec_name in GTFObins, please go to https://gtfobins.github.io/ and verify if SUID privilege escalation is possible".
 fi
done
}

suid_check
