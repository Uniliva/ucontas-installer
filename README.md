
# ucontas-installer
Repo usado para implanta aplicação, para testes e demostração através de docker-compose, com o back, o front e o banco

## Banco Oracle 12 SE

Para comprir o requisito do banco Oracle crei um container com o oracle 12c Standard Edition e salvei a [imagem no docker hub](https://hub.docker.com/repository/docker/uniliva/oracle_db).

É através desse repositorio, crio usuario, tabelas e massa inicial para teste com os scripts, na pasta scripts, durante a geração dos container com o docker compose.

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

## Referências

- https://github.com/oracle/docker-images/blob/master/OracleDatabase/SingleInstance/README.md