# Cidadão Conectado

## Desenvolvedores
| RM | Nome completo |
|----|---------------|
| RMXXXXX | NOME COMPLETO SEM ABREVIAÇÕES |
| RMXXXXX | NOME COMPLETO SEM ABREVIAÇÕES |
| RMXXXXX | NOME COMPLETO SEM ABREVIAÇÕES |

## Tema da Global Solution
Desafio FIAP: **CitizenTech** (2º semestre de 2026) - tecnologias criadas a partir das necessidades reais das pessoas.
ODS relacionados: 2, 3, 4, 11 e 13.

## Descrição da solução
Aplicativo mobile em Flutter que funciona como um catálogo de soluções CitizenTech. O cidadão
vê os destaques, filtra por categoria (mobilidade, saúde, educação, meio ambiente, agricultura e
cidadania) e abre os detalhes de cada solução (localidade, público beneficiado e ODS).

## Fluxo de telas
1. **Tela principal (HomeScreen):** destaques (lista horizontal) -> categorias/filtros (lista horizontal) -> soluções (lista vertical).
2. **Tela de detalhes (DetalheScreen):** aberta ao tocar em qualquer card; botão "Voltar" retorna à principal.

## Prints das telas
(inserir prints aqui: pasta `prints/`)

## API utilizada
Nenhuma API de dados. Os dados ficam em memória no repositório.
As imagens vêm de https://picsum.photos (imagens ilustrativas); sem internet, é exibido um ícone da categoria.

## Arquitetura
```
lib/
  main.dart                       -> MaterialApp e tema
  models/       categoria.dart    -> enum Categoria (filtros)
                solucao.dart      -> classe de modelo Solucao
  repositories/ solucao_repository.dart -> dados em memória (buscarTodas, buscarDestaques, buscarPorCategoria)
  screens/      home_screen.dart  -> StatefulWidget com setState (filtro)
                detalhe_screen.dart
  widgets/      solucao_card, destaque_card, categoria_chip,
                secao_titulo, info_linha, imagem_com_fallback
```
- Gerenciamento de estado: `setState` na `HomeScreen` (categoria selecionada e lista filtrada).
- A filtragem fica no repositório/modelo (`pertenceA`), não dentro do `build`.
- Destaques vêm dos mesmos dados, filtrando o atributo booleano `destaque`.

## Como executar
```
flutter pub get
flutter run
```
