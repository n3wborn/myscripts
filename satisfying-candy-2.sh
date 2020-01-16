#!/bin/bash -

#Bon, pour entamer la conversation avec Candy, il faut se tenir pret.
#Dans un autre term/buffer, on commence par lui passer un coup de fil.
# $ ii -s irc.hackerzvoice.net -p 6667  -n justatest -f justatest

#Si besoin, on se presente
#echo '/NickServ IDENTIFY motdepasse' >  /home/stef/irc/irc.hackerzvoice.net/in && echo "NickServ OK"

#on lui dit qu'on aimerait parler avec elle
echo '/j Candy !ep2' > /home/stef/irc/irc.hackerzvoice.net/in

#on lui laisse le temps de parler, mais pas trop ! on a que de quoi parler 2
#secondes, c'est peu
sleep 1

#on ecoute ce qu'elle a a dire
#num2=$(tail -1 /home/stef/irc/irc.hackerzvoice.net/candy/out | grep -oE '[[:digit:]]+ / [[:digit:]]+'   | cut -d " " -f3)
coded=$(tail -1 /home/stef/irc/irc.hackerzvoice.net/candy/out | grep -oE '[^ ]+$')
decoded=$(base64 -d  <<< "${coded}" | cut -d "%" -f1)

#on s'assure d'avoir bien compris
echo "coded = ${coded}"
echo "decoded = ${decoded} "

# Satisfaisons Candy ! Et surtout, sachons y mettre mes formes !!
LC_ALL=C printf '/j Candy !ep2 -rep %s\n' "${decoded}" > /home/stef/irc/irc.hackerzvoice.net/in
