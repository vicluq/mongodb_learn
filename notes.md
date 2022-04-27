# MongoDB Tutorial

## O que é uma Database (NoSQL)?

É um container que guarda **Coleções** e essas coleções são um conjunto de **Documentos**

Uma Coleção pode ser pensada como uma tabela e cada documento é um dado dessa coleção. Documentos são da estrutura Key:Value JSON-like.

Um **Schema** (no SQL são as colunas) dita o que um Documento de uma coleção terá, ou seja, sua estrutura e quais Keys e values são esperados. Os diferentes documentos de uma coleção podem ter diferentes schemas, logo, as **coleções não forçam um único schema padrão**.

Automaticamente o MongoDB adiciona um campo **_id**, o qual terá valor único.

Podemos fazer o Join de múltiplas coleções usando **Aggregation**.

'''
Database
    Collections
        Documents
'''

## Compass App

Podemos usar para criar coleções e documentos em uma base de dados. Além disso, podemos criar novas bases de dados.

## Conectando

### VsCode

Basta criar uma nova convexão na intrface gráfica, ou conectar com a padrão ja existente na porta **27017**

### Pelo terminal

- Entramos no path onde o executavel do MongoDB está instalado
    ex: "/c/Program Files/MongoDB/Server/[version]/bin"
- Agora podemos rodar comandos e "queries" do MongoDB

## Criando e Deletando Bases de Dados

- Exibir as bases de dado: *show databases;*

- Para criar uma DB: *use <db-name>* 
    - Esse comando **cria e seleciona** e *db* passa a referenciar ela
    - Devemos ver a mensagem **switched to db <db-name>**, para indicar que estamos com a nossa db selecionada
    - A DB estará visível apenas se tiver ao menos um documento nela

- Para deletar uma DB: *db.dropDatabase()*

- Exibir a DB que estamos trabalhando agora: *db*

## Criando e Deletando Coleções

- Exibindo collections de uma DB: *show collections;*
- Criando uma collection: *db.createCollection(name, opts);*
- Deletando uma collection: *db.[collection_name].drop();*

## Data Types no MongoDB

- BSON e JSON
    - Valores Key:Value
    - BSON é um data type do Mongo, uma versão do JSON usada para processar dados da maneira deles, performaticamente, Binary Encoded JSON

- Integer, Boolean, Double

- Array, Object, Null, Date, Timestamp, Object Id (os _id), Code

## Inserindo Documents na Collection

- Inserindo *um* documento: *db.[collection_name].insert(JSON-style obj)*
- Inserindo *varios* documentos: *db.[collection_name].insertMany([objs separados por virgula])*

O Mongo vai adicionar sozinho uma primary key "_id" diferente em cada documento e de 24 char e **podemos mudar, mas NÃO FAZER ISSO**

## Atualizando Documents

- Atualizando apenas **UM** documento que satisfaça a condição
    - db.[collection_name].update(
        {...condition key/value}, 
        {$set: {...new values}}
    )

- Atualizando **vários** documentos que satisfaçam a condição
    - db.[collection_name].updateMany(
        {...condition key/value}, 
        {$set: {...new values}}
    )

## Fazendo Query nas Collections

- Pegando todos os docs de uma collection
    *db.[collection_name].find()*
    *db.[collection_name].find().pretty()* => deixar mais apresentável

- Pegando o primeiro doc da collection
    *db.[collection_name].findOne()*

- Pegando docs segundo condições
    *db.[collection_name].find({key:value conditions})*

- Pegar 1 doc e trocar/deletar ele
    *db.[collection_name].findOneAndReplace({key:value cond}, <replacement>)*
    *db.[collection_name].findOneAndDelete({key:value cond})*

## Deletando Documents das Collections

- Deletando **UM** documento
    *db.[collection_name].deleteOne({..conditions})*
    *db.[collection_name].remove({..conditions}, { justOne: true })*

- Deletando **VÁRIOS** documentos
    *db.[collection_name].deleteMany({..conditions})*
    *db.[collection_name].remove({..conditions}, { justOne: false })*

## Queries mais Complexas com Op. Lógicos

- *$Eq* => Equal
- *$lt* => less than
- *$lte* => less than equal
- *$gt* => greater than
- *$gte* => greater than equal
- *$and* e *$or* => recebem um array com queries: [{}, {}]

    *db.[collection_name].find({ key: { $op: value } })*

ex:
    1. Pegar pessoas com renda maior ou igual a 10.000 por mes
        *db.people.find({ salary: { $gte: 10000 } })*
    2. Pessoas com idade maior que 18 e grau ocular menor que 2
        *db.people.find({ age: { $gte: 18 }, degree: { $lt: 2 } })*
        2.1. Usando com **$and**
            db.people.find({
                $and: [ { age: { $gte: 18 } }, { degree: { $lt: 2 } } ]
            })

## Retrieving Specific Fields
