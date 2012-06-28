#!/bin/sh

# Copiado a partir do exemplo de http://tldp.org/LDP/abs/html/parameter-substitution.html
: ${1?"Uso: $0 NOME (onde NOME é a entrada no /media)"}

# O UUID pode ser obtido via blkid
UUID="c12593f9-bb63-42cc-af51-3f5301da7158"

# Qual é a entrada do nosso dispositivo no /dev?
DEV=$(blkid -U $UUID)

if [ $(grep -c "^${DEV}" /proc/mounts) -eq 0 ]; then
    echo "Montando dispositivo"
    pmount $DEV $1
else
    echo "Desmontando dispositivo"
    pumount $DEV
fi    
