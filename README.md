
[<img src="https://raw.githubusercontent.com/alemaocastro1986/ignite-challenge-one/main/assets/elixir_full.png" width="180"/>]() 
# Desafios Elixir - Chapter III
## Sobre
Desafios Ignite [Rocketseat](https://rocketseat.com.br/)  trilha elixir __Chapter III__ .


## Desafio 01 - CRUD - Refeições diárias

Criar uma aplicação para monitoramento de consumo de alimentos durante o dia.

O schema de uma refeição deverá possuir os seguintes campos:
```elixir
%Meal{
	id: id,
	descricao: descricao,
	data: data,
	calorias: calorias
}
```
**Obs:** O Id deve ser gerado automaticamente, pode ser um inteiro ou um UUID, mas não pode se repetir.

- Para criar um campo com uma data no Ecto, em seu schema, você deverá utilizar o tipo `:datetime`;
- O campo `descricao` irá possuir informações sobre o que foi consumido no momento (tipo de dado: string);
- O campo `data` deverá armazenar a data e hora em que o alimento foi consumido;
- O campo `calorias` irá possuir informações sobre a quantidade de calorias do alimento consumido;
- Os dados deverão ser salvos em uma tabela chamada `meals`.

A aplicação deverá possuir rotas para satisfazer os requisitos de um CRUD normal:

1. Deve ser possível cadastrar uma refeição feita, retornando um status `201` e a informação criada;
2. Deve ser possível atualizar uma refeição já cadastrada, retornando um status `200` e a refeição atualizada;
3. Deve ser possível exibir uma refeição existente, retornando um status `200` e a refeição buscada;
4. Deve ser possível excluir uma refeição cadastrada, retornando um status `200` ou `204`.

## Desafio 02 -  Testando a aplicação

Criar testes para a aplicação.

__É importante que os testes tenham uma cobertura de 100%__.

```bash
----------------
COV    FILE                                        LINES RELEVANT   MISSED
100.0% lib/rocketnutri.ex                              7        3        0
100.0% lib/rocketnutri/application.ex                 37        3        0
100.0% lib/rocketnutri/error.ex                       17        4        0
100.0% lib/rocketnutri/helper.ex                      22        3        0
100.0% lib/rocketnutri/meals/create.ex                17        1        0
100.0% lib/rocketnutri/meals/meal.ex                  15        1        0
100.0% lib/rocketnutri/meals/repo.ex                  18        3        0
100.0% lib/rocketnutri/meals/update.ex                24        3        0
100.0% lib/rocketnutri/repo.ex                         5        0        0
100.0% lib/rocketnutri_web.ex                         81        0        0
100.0% lib/rocketnutri_web/channels/user_socket       35        0        0
100.0% lib/rocketnutri_web/controllers/fallback       30        2        0
100.0% lib/rocketnutri_web/controllers/meals_co       42        8        0
100.0% lib/rocketnutri_web/endpoint.ex                52        0        0
100.0% lib/rocketnutri_web/gettext.ex                 24        0        0
100.0% lib/rocketnutri_web/plugs/uuid_checker.e       25        6        0
100.0% lib/rocketnutri_web/router.ex                  35        1        0
100.0% lib/rocketnutri_web/telemetry.ex               55        3        0
100.0% lib/rocketnutri_web/views/error_view.ex        19        4        0
100.0% lib/rocketnutri_web/views/meals_view.ex        15        3        0
[TOTAL] 100.0%
----------------
```

## Testando

```bash
mix test
```