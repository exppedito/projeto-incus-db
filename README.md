# 🚀 Projeto de Infraestrutura: Banco de Dados em Contêiner (Incus)

Projeto de infraestrutura de redes focado na criação de um ambiente robusto, versionado e automatizado, simulando uma topologia corporativa.

## 🛠️ Tecnologias Utilizadas
- **Sistema Operacional:** Debian 12
- **Orquestração de Contêineres:** Incus
- **Banco de Dados:** PostgreSQL
- **Controle de Versão e Automação:** Git / Bash Scripting

## 🏗️ Arquitetura e Escopo do Projeto
O ambiente foi desenhado para escalar serviços com segurança e monitoramento:
- [x] Provisionamento do SGBD (PostgreSQL) isolado em contêiner.
- [x] Rotinas automatizadas de Disaster Recovery (Backup via Host).
- [x] Liberação de acesso externo e configuração de regras de rede.
- [x] Modelagem e população do banco via scripts IaC (Inventário de Redes e VPN).
- [ ] Implementação de Firewall para controle estrito de tráfego.
- [ ] Configuração de VPN (WireGuard) para acesso remoto seguro.
- [ ] Centralização e auditoria de logs com Graylog.

## 📂 Estrutura do Repositório
- `docs/`: Documentação detalhada da infraestrutura, IPs e mapeamento.
- `scripts/`: Scripts de automação (backup, regras de rede) e SQL de inicialização.

### 🛡️ Estratégia de Backup e Disaster Recovery (DR)

Para garantir a integridade dos dados e o funcionamento dos backups via `pg_dump` utilizando um usuário focado na aplicação (`admin_db`), foi necessário ajustar as permissões granulares do PostgreSQL.

**Resolução de Permissões (Tables e Sequences):**
Para evitar o erro de *Lock* (`permission denied`) durante o dump, o usuário precisa de acesso de leitura a todas as tabelas e também aos contadores de ID (Sequences) do schema `public`.

Os comandos aplicados via IaC/Bash no host para liberar esses acessos foram:
```bash
# Libera acesso a todas as tabelas existentes
incus exec db-postgres -- su - postgres -c "psql -d meubanco -c 'GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_db;'"

# Libera acesso a todas as Sequences (Essencial para IDs com auto-incremento/SERIAL)
incus exec db-postgres -- su - postgres -c "psql -d meubanco -c 'GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO admin_db;'"

# Com as permissões ajustadas, o backup remoto em texto puro é gerado com sucesso
pg_dump -h 10.231.209.127 -p 5432 -U admin_db -d meubanco > backup.sql


