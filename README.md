
# ucontas-installer
Repo usado para implanta aplicação, para testes e demostração através de docker-compose, com o back, o front e o banco.


---

## Como Executar localmente

- Passo 1: Requisitos

Para instalar a aplicação e necessário ter o **docker** e o **docker-compose**.

- Passo 2: Baxe o projeto

Cumprindo os requisitos do passo 1, acesse a maquina que tem o docker e faça download desse projeto.

- Passo 3: Implantando a aplicação

Depois acesse a pasta e execute

```
docker-compose up -d
```

**Obs:** 
    
    - A opção -d e para rodar detachado, liberando o terminal.
    - Como será baixado as imagens e gerado os containers, esse processo pode demorar alguns minutos na primeira vez que for executado.

- Passo 4: Acessando a aplicação

Passa acessar a aplicação use:

```
Uconstas-front: http://localhost:9095/
Ucontas-api swagger: http://localhost:9090/swagger-ui.html
```

**Obs:** Substitua _localhost_ pelo ip da maquina que esta executando o **docker**.



---
---

# Estrutura do projeto

## Banco Oracle 12 SE

Para comprir o requisito do banco Oracle crei um container com o oracle 12c Standard Edition e salvei a [imagem no docker hub](https://hub.docker.com/repository/docker/uniliva/oracle_db).

É através desse repositório, crio usuario, tabelas e massa inicial para teste com os scripts, na pasta scripts, durante a geração dos container com o docker compose.

### Dados de acesso


```shellscript
hostname: localhost
port: 1521
sid: ORCLCDB
service name: ORCLCDB

#  Usuario system
username: system
password: unisenha

# Usuario uconta_user
username: uconta_user
password: unisenha
```

---

## API REST

Foi criada uma api rest simples para contas com categorização, através do **docker compose** é gerado um conteiner com essa api. COMO ASSIM?

No **GitHub** criei um projeto, o [UContas](https://github.com/Uniliva/ucontas) , utilizando spring boot, que através do **travis-ci** é gerado uma imagem da aplicação que é salvo no **Docker Hub** ([AQUI](https://hub.docker.com/repository/docker/uniliva/ucontas-api)) e através dessa imagem é gerado o container.


---

## Front

A partir do projeto desenvolvido com angular que esta disponivel no github , [ucontas-front](https://github.com/Uniliva/ucontas-front), foi gerada uma imagem docker através do **travis-ci** e salvo no **Docker Hub** ([AQUI](https://hub.docker.com/r/uniliva/ucontas-front)) que é usada para montar o container.

---

# Referências

- https://github.com/oracle/docker-images/blob/master/OracleDatabase/SingleInstance/README.md