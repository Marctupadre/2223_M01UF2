#!/bin/bash

PORT="2223"
SERVER_AD="localhost"

echo "Servidor Transfer Unite Recursive International Protocol: TURIP"

echo "(0) LISTEN Handshake"
MSG=`nc -l $PORT`

HANDSHAKE=`echo $MSG | cut -d " " -f 1`
IP_CLIENT=`echo $MSG | cut -d " " -f 2` 

if [ "$MSG" != "HOLI_TURIP" ]
then
	echo "ERROR 1: HandShake incorrecto"

	echo "KO_TURIP" | nc $IP_CLIENT $PORT
	exit 1
fi

echo "OK_TURIP" | nc $IP_CLIENT $PORT

echo "(4) LISTEN"

MSG=`nc -l $PORT`

PREFIX=`echo $MSG | cut -d " " -f 1`
FILE_NAME=`echo $MSG | cut -d " " -f 2`

echo "(7) SEND: Comprobacion archivo"

if [ "$PREFIX" != "FILE_NAME" ]
then
	echo "ERROR 2: nombre de archivo mal formado"
	
	echo "KO_FIEL_NAME" | nc $IP_CLIENT $PORT

	exit 2
fi

echo "OK_FILE_NAME" | nc $IP_CLIENT $PORT

MSG=`nc -l $PORT`








exit 0
