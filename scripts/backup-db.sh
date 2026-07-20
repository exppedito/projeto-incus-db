#!/bin/bash
# Script de backup do PostgreSQL rodando no Incus

DATA=$(date +"%Y%m%d_%H%M%S")
ARQUIVO="backup_meubanco_$DATA.sql"
CAMINHO_BACKUP="/home/expedito/projeto-incus-db/scripts/$ARQUIVO"

echo "[*] Iniciando backup do banco 'meubanco'..."

# 1. Gera o arquivo de backup DENTRO do container (na pasta /tmp)
incus exec db-postgres -- su - postgres -c "pg_dump meubanco > /tmp/$ARQUIVO"

# 2. Puxa o arquivo pronto do container para o seu Debian (Host)
incus file pull db-postgres/tmp/$ARQUIVO $CAMINHO_BACKUP

# 3. Apaga o arquivo temporário de dentro do container para não consumir disco à toa
incus exec db-postgres -- rm /tmp/$ARQUIVO

echo "[+] Backup concluido e transferido com sucesso: $ARQUIVO"
