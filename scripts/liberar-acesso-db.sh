#!/bin/bash
# Script para liberar acesso externo ao PostgreSQL rodando no Incus

echo "[*] Configurando listen_addresses no postgresql.conf..."
# O sed vai buscar a linha com 'localhost' e trocar pelo '*'
incus exec db-postgres -- bash -c "sed -i \"s/listen_addresses = 'localhost'/listen_addresses = '*'/g\" /etc/postgresql/*/main/postgresql.conf"

echo "[*] Adicionando regra de rede no pg_hba.conf..."
incus exec db-postgres -- bash -c "echo 'host    all             all             0.0.0.0/0               md5' >> /etc/postgresql/*/main/pg_hba.conf"

echo "[*] Reiniciando o servico do PostgreSQL..."
incus exec db-postgres -- systemctl restart postgresql

echo "[+] Acesso externo configurado e liberado com sucesso!"
