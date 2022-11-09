#!/bin/bash

PORT="2223"
SERVER_AD="localhost"

echo "Cliente TURIP"

echo "(1) SEND: Handshake HOLI_TURIP"

echo "HOLI_TURIP 127.0.0.1" | nc $SERVER_AD $PORT

echo "(2) LISTEN: Comprobacion Handshake"

MSG=`nc -l $PORT`

if [ "$MSG" != "OK_TURIP" ]
then
	echo "ERROR 1: Handshake incorrecto"
	exit 1 
fi

echo "(5) SEND: Nombre del archivo"

echo "FILE_NAME vaca.vaca" | nc localhost $PORT

echo "(6) LISTEN: comprobacion nombre de archivo"

MSG=`np -l $PORT`







exit 0
