import sqlite3

conexao = sqlite3.connect('Dados')
cursor = conexao.cursor()

## CRIANDO A TABELO ALUNOS

cursor.execute('CREATE TABLE alunos(id INT, nome VARCHAR(100), idade INT, curso VARCHAR(100))')

#Inserindo registros

cursor.execute('INSERT INTO alunos(id, nome, idade, curso) VALUES (1, "Cláudia", 21, "Tecnologia")')
cursor.execute('INSERT INTO alunos(id, nome, idade, curso) VALUES (2, "Clara", 23, "Engenharia")')
cursor.execute('INSERT INTO alunos(id, nome, idade, curso) VALUES (3, "Marcus", 19, "Agronomia")')
cursor.execute('INSERT INTO alunos(id, nome, idade, curso) VALUES (4, "João", 20, "Engenharia")')
cursor.execute('INSERT INTO alunos(id, nome, idade, curso) VALUES (5, "Alice", 19, "Medicina vet")')
cursor.execute('INSERT INTO alunos(id, nome, idade, curso) VALUES (6, "Marcia", 19, "Engenharia")')
cursor.execute('INSERT INTO alunos(id, nome, idade, curso) VALUES (7, "Beatriz", 23, "Psicologia")')

#Consultas básicas

#a)
registros = cursor.execute('SELECT * FROM alunos')
for alunos in registros:
    print(alunos)

#b)
registros = cursor.execute('SELECT nome FROM alunos WHERE idade>20')
for alunos in registros:
    print(alunos)

#c)
registros = cursor.execute('SELECT nome,curso FROM alunos GROUP BY nome,curso HAVING curso="Engenharia"')
for alunos in registros:
    print(alunos)

#d)
registros = cursor.execute('SELECT COUNT(id) FROM alunos')
for alunos in registros:
    print(alunos)

#Atualização e remoção

#a)
registros = cursor.execute('UPDATE alunos SET idade="22" WHERE nome="Cláudia"')
for alunos in registros:
    print(alunos)

#b)
registros = cursor.execute('DELETE FROM alunos where id=3')
for alunos in registros:
    print(alunos)

## CRIANDO A TABELA CLIENTES

cursor.execute('CREATE TABLE clientes(id INT, nome VARCHAR(100), idade INT, saldo FLOAT)')

#Inserindo registros

cursor.execute('INSERT INTO clientes(id, nome, idade, saldo) VALUES (10, "Cláudia", 31, 5000)')
cursor.execute('INSERT INTO clientes(id, nome, idade, saldo) VALUES (11, "Renata", 28, 1500)')
cursor.execute('INSERT INTO clientes(id, nome, idade, saldo) VALUES (12, "Oliver", 45, 10000)')
cursor.execute('INSERT INTO clientes(id, nome, idade, saldo) VALUES (13, "Debora", 30, 500)')
cursor.execute('INSERT INTO clientes(id, nome, idade, saldo) VALUES (14, "Spencer", 32, 15000)')
cursor.execute('INSERT INTO clientes(id, nome, idade, saldo) VALUES (15, "Aaron", 29, 7000)')
cursor.execute('INSERT INTO clientes(id, nome, idade, saldo) VALUES (16, "Laila", 36, 700)')
cursor.execute('INSERT INTO clientes(id, nome, idade, saldo) VALUES (17, "Fred", 40, 900)')

#Consultas e funções agregadas

#a)
registros = cursor.execute('SELECT nome,idade FROM clientes GROUP BY nome,idade HAVING idade>30')
for clientes in registros:
    print(clientes)

#b)
registros = cursor.execute('SELECT AVG(saldo) FROM clientes')
for clientes in registros:
    print(clientes)

#c)
registros = cursor.execute('SELECT nome, MAX(saldo) FROM clientes')
for clientes in registros:
    print(clientes)

#d)
registros = cursor.execute('SELECT nome, saldo FROM clientes GROUP BY nome, saldo HAVING saldo>1000')
for clientes in registros:
    print(clientes)

#Atualização e remoção com condições

#a)
registros = cursor.execute('UPDATE clientes SET saldo=400 WHERE nome="Renata"')
for clientes in registros:
    print(clientes)

#b)
registros = cursor.execute('DELETE FROM clientes where id=13')
for clientes in registros:
    print(clientes)

## JUNÇÃO DE TABELAS - CRIANDO A TABELA COMPRAS

cursor.execute('CREATE TABLE compras(id INT, clientes_id INT, produto VARCHAR(100), valor FLOAT)')

#Inserindo registros

cursor.execute('INSERT INTO compras(id, clientes_id, produto, valor) VALUES (2, 11, "extrato", 3)')
cursor.execute('INSERT INTO compras(id, clientes_id, produto, valor) VALUES (3, 12, "refrigerante", 10)')
cursor.execute('INSERT INTO compras(id, clientes_id, produto, valor) VALUES (4, 14, "açucar", 20)')
cursor.execute('INSERT INTO compras(id, clientes_id, produto, valor) VALUES (5, 15, "feijão", 11)')
cursor.execute('INSERT INTO compras(id, clientes_id, produto, valor) VALUES (6, 16, "detergente", 4)')
cursor.execute('INSERT INTO compras(id, clientes_id, produto, valor) VALUES (7, 17, "sabão em pó", 21)')

#Consulta

registros = cursor.execute('SELECT nome, produto, valor FROM compras INNER JOIN clientes ON compras.clientes_id = clientes.id')
for compras in registros:
    print(compras)


conexao.commit()
conexao.close
