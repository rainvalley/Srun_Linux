#!/bin/bash
Stu_No="201916050318"
Stu_Passwd="aWORD1234"
URL="http://172.16.154.130:69/cgi-bin/srun_portal"
Encrypted_No="{SRUN3}\r\n"
Encrypted_Passwd=""

for ((i=0;i<${#Stu_No};i++))
do
    letter=$(printf "%d" "'${Stu_No:$i:1}")
    let letter=letter+4
    letter=$(printf \\x`printf %x $letter`)
    result+=$letter
done
Encrypted_No=$Encrypted_No$result


for ((i=0;i<${#Stu_Passwd};i++))
do
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
    if  test $[$i%2] -eq 1
    then
        result=$_h$_l
    else
        result=$_l$_h
    fi
    Encrypted_Passwd+=$result
done

curl -X POST --data-urlencode "username=$Encrypted_No" --data-urlencode "password=$Encrypted_Passwd" --data-urlencode "ac_id=2" --data-urlencode "action=login" --data-urlencode "type=3" --data-urlencode "n=117" --data-urlencode "mbytes=0" --data-urlencode "minutes=0" --data-urlencode "drop=0" --data-urlencode "pop=1" --data-urlencode "mac=02:00:00:00:00:00" $URL