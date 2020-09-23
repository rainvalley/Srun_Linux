#!/bin/bash
Stu_No=$1
Stu_Passwd=$2
URL="http://172.16.154.130:69/cgi-bin/srun_portal"
Encrypted_No="{SRUN3}\r\n"
Encrypted_Passwd=""

for i in `seq ${#Stu_No}`
do
    letter=$(printf "%d" "'${Stu_No:$i-1:1}")
    let letter=letter+4
    letter=$(printf \\x`printf %x $letter`)
    Encrypted_No=$Encrypted_No$letter
done
Encrypted_No=${Encrypted_No%?}

for i in `seq ${#Stu_Passwd}`
do
    i=$(($i-1))
    letter=$(printf "%d" "'${Stu_Passwd:$i:1}")
    if test $i -eq 0
    then
        ki=$(($letter^48))
    else
        ki=$(($letter^((10-i%10)+48)))
    fi
    _l=$((($ki&0x0f)+0x36))
    _h=$((($ki>>4&0x0f)+0x63))
    _l=$(printf \\x`printf %x $_l`)
    _h=$(printf \\x`printf %x $_h`)
    if  test $(($i%2)) -eq 1
    then
        result=$_h$_l
    else
        result=$_l$_h
    fi
    Encrypted_Passwd=$Encrypted_Passwd$result
done
curl -X POST --data-urlencode "username={SRUN3}\r\n645=5:49475<" --data-urlencode "password=$Encrypted_Passwd" --data-urlencode "ac_id=2" --data-urlencode "action=login" --data-urlencode "type=3" --data-urlencecho ""