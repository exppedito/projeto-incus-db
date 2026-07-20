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
