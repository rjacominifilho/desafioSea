#!/bin/bash

echo "Iniciando todos os testes no Chrome..."
# O parâmetro -d diz ao Robot para jogar os resultados na pasta 'results'
robot -d results -v BROWSER:chrome Tests

echo "Iniciando todos os testes no Firefox..."
robot -d results -v BROWSER:firefox Tests

echo "Todos os testes foram finalizados! Verifique a pasta 'results' para ver os relatórios."