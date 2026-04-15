FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey - bandit10
dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr - bandit11
7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4
FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn - bandit13 (this was annoyying to get)


Passwords were reset
bandit0 - bandit0
cat readme

ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If - bandit1
cat ./-

263JGJPfgU6LtdEvgfWU1XP5yac29mFx - bandit2
cat ./--spaces\ in\ this\ filename-- 


MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx - bandit3
cat inhere/...Hiding-From-You

2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ - bandit4
file inhere/*
cat inhere/-file07

4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw - bandit5
Refer to https://overthewire.org/wargames/bandit/bandit6.html
and craft the appropriate find command

HWasnPhtq9AVKe0dmk45nxy20cvUa6EG - bandit6
find / -user bandit7 -group bandit6 -size 33c 2>/dev/null

morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj - bandit7
grep millionth data.txt

dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc - bandit8
sort data.txt | uniq -u

4CKMh1JI91bUIZZPXDqGanal4xvAg0JM - bandit9
strings data.txt | grep -E "={2,}"

FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey - bandit10
base64 -d data.txt

dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr - bandit11
tr <data.txt 'A-Za-z' 'N-ZA-Mn-za-m'

7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4 - bandit12
copy the file over to a temporary directory
mktemp -d

xxd -r data.txt > data #Unwrap the hexdump
file data # Check what compression if any is on the file

# Continue the pattern until you get to acii file
mv data data.gz
gzip -d data.gz

mv data data.bz
bzip2 -d data.bz

mv data data.tar
tar -xf data.tar -O > data

FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn - bandit 13
scp -P 2220 bandit13@bandit.labs.overthewire.org:~/sshkey.private bandit/
chmod 600 bandit/sshkey.private


ssh bandit.labs.overthewire.org -p 2220 -l bandit14 -i bandit/sshkey.private
MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS - bandit14
cat /etc/bandit_pass/bandit14
nc 127.0.0.1 30000 </etc/bandit_pass/bandit14

8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo - bandit15
openssl s_client -connect localhost:30001
openssl s_client -quiet -connect localhost:30001 </etc/bandit_pass/bandit15 2>/dev/null


kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx - bandit16
tmpdir=$(mktemp -d) && cd $tmpdir
nmap -sV --version-light -oX scan.xml -p 31000-32000 localhost
openssl s_client -quiet -connect localhost:31790 </etc/bandit_pass/bandit16 2>/dev/null

privatekey - bandit17
diff passwords.new passwords.old

x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO - bandit18
ssh bandit.labs.overthewire.org -p 2220 -l bandit18 cat readme

cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8 - bandit19
./bandit20-do cat /etc/bandit_pass/bandit20

0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO - bandit20
nc -l -p 1234 </etc/bandit_pass/bandit20 & wait & ./suconnect 1234

EeoULMCra2q0dSkYj561DX7s1CpBuOBt - bandit21
cat /etc/cron.d/cronjob_bandit22
cat /usr/bin/cronjob_bandit22.sh
cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv


tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q - bandit22
cat /usr/bin/cronjob_bandit23.sh
cat /tmp/8169b67bd894ddbb4412f91573b38db3

0Zf11ioIjMVN551jX3CmStKLYqjk54Ga - bandit23
put script in /var/spool/bandit24/foo


gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8 - bandit24
pw='gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8'
for i in {0000..9999}; do echo $pw $i >> lst.txt; done;
cat lst.txt | nc localhost 30002 | grep -iv wrong

iCi86ttT4KSNe1armKiwbQNmB3YJP3q4 - bandit25
cat bandit26.sshkey

-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEApis2AuoooEqeYWamtwX2k5z9uU1Afl2F8VyXQqbv/LTrIwdW
pTfaeRHXzr0Y0a5Oe3GB/+W2+PReif+bPZlzTY1XFwpk+DiHk1kmL0moEW8HJuT9
/5XbnpjSzn0eEAfFax2OcopjrzVqdBJQerkj0puv3UXY07AskgkyD5XepwGAlJOG
xZsMq1oZqQ0W29aBtfykuGie2bxroRjuAPrYM4o3MMmtlNE5fC4G9Ihq0eq73MDi
1ze6d2jIGce873qxn308BA2qhRPJNEbnPev5gI+5tU+UxebW8KLbk0EhoXB953Ix
3lgOIrT9Y6skRjsMSFmC6WN/O7ovu8QzGqxdywIDAQABAoIBAAaXoETtVT9GtpHW
qLaKHgYtLEO1tOFOhInWyolyZgL4inuRRva3CIvVEWK6TcnDyIlNL4MfcerehwGi
il4fQFvLR7E6UFcopvhJiSJHIcvPQ9FfNFR3dYcNOQ/IFvE73bEqMwSISPwiel6w
e1DjF3C7jHaS1s9PJfWFN982aublL/yLbJP+ou3ifdljS7QzjWZA8NRiMwmBGPIh
Yq8weR3jIVQl3ndEYxO7Cr/wXXebZwlP6CPZb67rBy0jg+366mxQbDZIwZYEaUME
zY5izFclr/kKj4s7NTRkC76Yx+rTNP5+BX+JT+rgz5aoQq8ghMw43NYwxjXym/MX
c8X8g0ECgYEA1crBUAR1gSkM+5mGjjoFLJKrFP+IhUHFh25qGI4Dcxxh1f3M53le
wF1rkp5SJnHRFm9IW3gM1JoF0PQxI5aXHRGHphwPeKnsQ/xQBRWCeYpqTme9amJV
tD3aDHkpIhYxkNxqol5gDCAt6tdFSxqPaNfdfsfaAOXiKGrQESUjIBcCgYEAxvmI
2ROJsBXaiM4Iyg9hUpjZIn8TW2UlH76pojFG6/KBd1NcnW3fu0ZUU790wAu7QbbU
i7pieeqCqSYcZsmkhnOvbdx54A6NNCR2btc+si6pDOe1jdsGdXISDRHFb9QxjZCj
6xzWMNvb5n1yUb9w9nfN1PZzATfUsOV+Fy8CbG0CgYEAifkTLwfhqZyLk2huTSWm
pzB0ltWfDpj22MNqVzR3h3d+sHLeJVjPzIe9396rF8KGdNsWsGlWpnJMZKDjgZsz
JQBmMc6UMYRARVP1dIKANN4eY0FSHfEebHcqXLho0mXOUTXe37DWfZza5V9Oify3
JquBd8uUptW1Ue41H4t/ErsCgYEArc5FYtF1QXIlfcDz3oUGz16itUZpgzlb71nd
1cbTm8EupCwWR5I1j+IEQU+JTUQyI1nwWcnKwZI+5kBbKNJUu/mLsRyY/UXYxEZh
ibrNklm94373kV1US/0DlZUDcQba7jz9Yp/C3dT/RlwoIw5mP3UxQCizFspNKOSe
euPeaxUCgYEAntklXwBbokgdDup/u/3ms5Lb/bm22zDOCg2HrlWQCqKEkWkAO6R5
/Wwyqhp/wTl8VXjxWo+W+DmewGdPHGQQ5fFdqgpuQpGUq24YZS8m66v5ANBwd76t
IZdtF5HXs2S5CADTwniUS5mX1HO9l5gUkk+h0cH5JnPtsMCnAUM+BRY=
-----END RSA PRIVATE KEY-----
