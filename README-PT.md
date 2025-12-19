# Sistema de Votação de Condomínio - Smart Contract Hardhat

[![Solidity](https://img.shields.io/badge/Solidity-0.8.17-blue)](https://soliditylang.org/)
[![Hardhat](https://img.shields.io/badge/Hardhat-2.14.1-yellow)](https://hardhat.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

> 🇺🇸 [English Version](./README.md)

Um exemplo simples e didático de um **Sistema de Votação para Condomínios** construído com Solidity e Hardhat. Este projeto demonstra operações CRUD, padrões de controle de acesso e mecanismos de votação na blockchain Ethereum.

Perfeito para iniciantes que estão aprendendo desenvolvimento de smart contracts! 🚀

---

## 📋 Índice

- [Sobre o Projeto](#-sobre-o-projeto)
- [Funcionalidades](#-funcionalidades)
- [Tecnologias](#-tecnologias)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Pré-requisitos](#-pré-requisitos)
- [Instalação](#-instalação)
- [Configuração](#-configuração)
- [Uso](#-uso)
- [Testes](#-testes)
- [Deploy](#-deploy)
- [Visão Geral do Smart Contract](#-visão-geral-do-smart-contract)
- [Recursos de Aprendizado](#-recursos-de-aprendizado)
- [Licença](#-licença)

---

## 🎯 Sobre o Projeto

Este projeto simula um **sistema de gestão de condomínio** onde os moradores podem:
- Registrar e gerenciar moradores
- Criar tópicos de discussão
- Votar em propostas
- Acompanhar resultados das votações

O smart contract implementa padrões comuns de blockchain como:
- **Padrão Ownable** (papel de síndico/manager)
- **Controle de Acesso** (síndico, conselheiros, moradores)
- **Operações CRUD** (Create, Read, Update, Delete)
- **Máquina de Estados** (gerenciamento de status dos tópicos)

---

## ✨ Funcionalidades

### 👥 Gestão de Moradores
- ✅ Adicionar moradores a unidades específicas (apartamentos)
- ✅ Remover moradores
- ✅ Atribuir papéis de conselheiro
- ✅ Transferir propriedade do síndico

### 📝 Gestão de Tópicos
- ✅ Criar tópicos de discussão
- ✅ Remover tópicos ociosos
- ✅ Abrir tópicos para votação
- ✅ Encerrar votação e calcular resultados

### 🗳️ Sistema de Votação
- ✅ Votar SIM, NÃO ou ABSTENÇÃO
- ✅ Um voto por residência
- ✅ Cálculo automático de resultados
- ✅ Aprovação/negação de tópicos baseada em votos

---

## 🛠️ Tecnologias

Este projeto utiliza ferramentas modernas de desenvolvimento Web3:

- **[Solidity](https://soliditylang.org/)** `^0.8.17` - Linguagem de programação de smart contracts
- **[Hardhat](https://hardhat.org/)** `^2.14.1` - Ambiente de desenvolvimento Ethereum
- **[Ethers.js](https://docs.ethers.org/)** - Biblioteca Ethereum para deploy e testes
- **[TypeScript](https://www.typescriptlang.org/)** - Desenvolvimento com tipagem segura
- **[Chai](https://www.chaijs.com/)** - Asserções para testes
- **[dotenv](https://www.npmjs.com/package/dotenv)** - Gerenciamento de variáveis de ambiente

---

## 📁 Estrutura do Projeto

```
crud-hardhat/
├── contracts/
│   └── Condominium.sol      # Smart contract principal
├── scripts/
│   └── deploy.ts            # Script de deploy
├── test/
│   └── Condominium.test.ts  # Suíte completa de testes
├── hardhat.config.ts        # Configuração do Hardhat
├── .env.example             # Template de variáveis de ambiente
├── package.json             # Dependências do projeto
└── tsconfig.json            # Configuração TypeScript
```

---

## 📦 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- **[Node.js](https://nodejs.org/)** (v16 ou superior)
- **[npm](https://www.npmjs.com/)** ou **[yarn](https://yarnpkg.com/)**
- Um editor de código (recomendamos o [VS Code](https://code.visualstudio.com/))
- Conhecimento básico de JavaScript/TypeScript
- Entendimento básico de conceitos de blockchain

---

## 🚀 Instalação

1. **Clone o repositório** (ou baixe o projeto):
```bash
git clone <url-do-repositorio>
cd crud-hardhat
```

2. **Instale as dependências**:
```bash
npm install
```

Isso instalará:
- Hardhat e seu toolbox
- Ethers.js para interações com blockchain
- Utilitários de teste
- Suporte a TypeScript

---

## ⚙️ Configuração

### 1. Criar Arquivo de Ambiente

Copie o arquivo de exemplo:
```bash
cp .env.example .env
```

### 2. Configurar Variáveis de Ambiente

Edite o arquivo `.env` com suas credenciais:

```env
# Para desenvolvimento local (Ganache)
GANACHE_SECRET=sua frase mnemônica de doze palavras aqui

# Para testnet Ethereum (Sepolia, Goerli, etc.)
ETHER_SECRET=sua frase mnemônica de doze palavras aqui

# Para testnet BSC
BSC_SECRET=sua frase mnemônica de doze palavras aqui

# URL do nó RPC (exemplo para testnet BSC)
NODE_URL=https://data-seed-prebsc-1-s3.binance.org:8545

# Chain ID (97 para BSC testnet, 11155111 para Sepolia)
CHAIN_ID=97

# Chaves de API do Block Explorer (para verificação de contratos)
ETHERSCAN_API_KEY=sua_chave_api_etherscan
BSC_API_KEY=sua_chave_api_bscscan
```

### 3. Onde Obter Esses Valores

- **Frase Mnemônica**: Da sua carteira (MetaMask, Trust Wallet, etc.)
  - ⚠️ **NUNCA compartilhe seu mnemônico da mainnet!** Use apenas carteiras de testnet para aprendizado
- **NODE_URL**: Obtenha endpoints RPC gratuitos em:
  - [Infura](https://infura.io/)
  - [Alchemy](https://www.alchemy.com/)
  - [QuickNode](https://www.quicknode.com/)
- **Chaves de API**: Registre-se em:
  - [Etherscan](https://etherscan.io/apis) para Ethereum
  - [BscScan](https://bscscan.com/apis) para BSC

---

## 💻 Uso

### Compilar o Smart Contract

```bash
npx hardhat compile
```

Isso gera:
- `artifacts/` - Artefatos do contrato compilado
- `typechain-types/` - Definições de tipos TypeScript

### Executar Testes

```bash
npx hardhat test
```

Saída esperada:
```
  Condominium
    ✓ Should be residence
    ✓ Should add resident
    ✓ Should NOT add resident (not council or manager)
    ... (e muitos outros testes)

  29 passing (2s)
```

### Deploy Local

Inicie um nó Hardhat local:
```bash
npx hardhat node
```

Em outro terminal, faça o deploy:
```bash
npx hardhat run scripts/deploy.ts --network localhost
```

### Deploy em Testnet

Faça deploy na testnet BSC (ou qualquer rede configurada):
```bash
npx hardhat run scripts/deploy.ts --network bsctest
```

### Verificar Contrato no Block Explorer

Após o deploy, verifique seu contrato:
```bash
npx hardhat verify --network bsctest <ENDERECO_DO_CONTRATO>
```

---

## 🧪 Testes

O projeto inclui **29 testes abrangentes** cobrindo:

### Categorias de Testes

1. **Gestão de Residências**
   - Verificação de existência de residências
   - Validação de IDs de residências

2. **Operações de Moradores**
   - Adicionar moradores
   - Remover moradores
   - Verificações de permissão
   - Restrições de conselheiros

3. **Gestão de Conselheiros**
   - Definir conselheiros
   - Remover conselheiros
   - Regras de validação

4. **Operações do Síndico**
   - Transferir propriedade
   - Validação de permissões

5. **CRUD de Tópicos**
   - Criar tópicos
   - Remover tópicos
   - Validação de status
   - Prevenção de duplicatas

6. **Fluxo de Votação**
   - Abrir votação
   - Registrar votos
   - Encerrar votação
   - Cálculo de resultados
   - Prevenção de votos duplicados

### Executar Testes Específicos

```bash
# Executar todos os testes
npx hardhat test

# Executar com relatório de gas
REPORT_GAS=true npx hardhat test

# Executar arquivo de teste específico
npx hardhat test test/Condominium.test.ts
```

---

## 🚀 Deploy

### Deploy Local (para testes)

```bash
# Terminal 1: Iniciar nó local
npx hardhat node

# Terminal 2: Deploy
npx hardhat run scripts/deploy.ts --network localhost
```

### Deploy em Testnet

1. **Obter tokens de testnet**:
   - BSC Testnet: [BSC Faucet](https://testnet.binance.org/faucet-smart)
   - Ethereum Sepolia: [Sepolia Faucet](https://sepoliafaucet.com/)

2. **Configure sua rede** em `hardhat.config.ts`

3. **Faça o deploy**:
```bash
npx hardhat run scripts/deploy.ts --network bsctest
```

4. **Salve o endereço do contrato** da saída:
```
Contract deployed to: 0xa018Fc9DecA4A08661Cb214f666538ED988fdfB3
```

---

## 📖 Visão Geral do Smart Contract

### Arquitetura do Contrato

```
Condominium.sol
├── Enums
│   ├── Status (IDLE, VOTING, APPROVED, DENIED)
│   └── Options (EMPTY, YES, NO, ABSTENTION)
├── Structs
│   ├── Topic (título, descrição, status, datas)
│   └── Vote (morador, residência, opção, timestamp)
├── Variáveis de Estado
│   ├── manager (endereço)
│   ├── residences (mapping)
│   ├── residents (mapping)
│   ├── counselors (mapping)
│   ├── topics (mapping)
│   └── votings (mapping)
└── Funções
    ├── Gestão de Moradores (adicionar, remover, verificar)
    ├── Gestão de Conselheiros (definir, remover)
    ├── Gestão do Síndico (transferir propriedade)
    ├── Gestão de Tópicos (adicionar, remover, obter)
    └── Votação (abrir, votar, encerrar, contar)
```

### Conceitos Principais

#### 1. **Sistema de Residências**
O contrato gerencia 50 residências (apartamentos):
- 2 blocos (1000, 2000)
- 5 andares por bloco (100-500)
- 5 unidades por andar (1-5)
- Exemplo: `2102` = Bloco 2, Andar 1, Unidade 2

#### 2. **Controle de Acesso**
Três níveis de permissão:
- **Síndico (Manager)**: Controle total (inicialmente o deployer)
- **Conselheiros**: Podem adicionar moradores
- **Moradores**: Podem criar tópicos e votar

#### 3. **Ciclo de Vida do Tópico**
```
IDLE → VOTING → APPROVED/DENIED
  ↓       ↓
DELETE   CLOSE
```

#### 4. **Regras de Votação**
- Um voto por residência (não por pessoa)
- Opções: SIM, NÃO, ABSTENÇÃO
- Aprovação: votos SIM > votos NÃO
- Síndico encerra votação e calcula resultados

---

## 📚 Recursos de Aprendizado

### Caminho de Aprendizado Recomendado

1. **Fundamentos de Blockchain**
   - [Blockchain Demo](https://andersbrownworth.com/blockchain/)
   - [Ethereum Whitepaper](https://ethereum.org/pt/whitepaper/)

2. **Solidity**
   - [Documentação Solidity](https://docs.soliditylang.org/)
   - [CryptoZombies](https://cryptozombies.io/pt/)
   - [Solidity by Example](https://solidity-by-example.org/)

3. **Hardhat**
   - [Documentação Hardhat](https://hardhat.org/docs)
   - [Tutorial Hardhat](https://hardhat.org/tutorial)

4. **Testes**
   - [Guia de Testes Hardhat](https://hardhat.org/hardhat-runner/docs/guides/test-contracts)
   - [Chai Matchers](https://hardhat.org/hardhat-chai-matchers/docs/overview)

### Próximos Passos

Após dominar este projeto, tente:
- Adicionar eventos para ações importantes
- Implementar prazos de votação baseados em tempo
- Criar um frontend com React + Ethers.js
- Adicionar votação ponderada (por tamanho da residência)
- Implementar categorias de propostas
- Adicionar requisitos de quórum

---

## 🤝 Contribuindo

Este é um projeto educacional. Sinta-se livre para:
- Reportar bugs
- Sugerir melhorias
- Criar pull requests
- Usar como template de aprendizado

---

## 📄 Licença

Este projeto está licenciado sob a **Licença MIT** - veja o cabeçalho do contrato para detalhes.

---

## ⚠️ Aviso de Segurança

**Este é um projeto educacional!** 

- ⚠️ Não auditado para uso em produção
- ⚠️ Use apenas tokens de testnet
- ⚠️ Nunca compartilhe suas chaves privadas ou frases mnemônicas
- ⚠️ Revise e entenda o código antes de fazer deploy

---

## 📞 Suporte

Se você está aprendendo e tem dúvidas:
- Leia a [Documentação do Hardhat](https://hardhat.org/docs)
- Confira o [Ethereum Stack Exchange](https://ethereum.stackexchange.com/)
- Participe do [Discord do Hardhat](https://hardhat.org/discord)

---

**Bons Estudos! 🎓✨**

Construído com ❤️ para educação em blockchain
