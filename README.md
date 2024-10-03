# Projeto de Consulta de CEP

Este projeto é um aplicativo Flutter que permite ao usuário consultar informações de um CEP e exibir o local correspondente. O aplicativo utiliza uma API externa para obter os dados.

## Estrutura do Projeto

### Diretório `shared` (lib/src/shared)
- **colors**: Define as cores usadas no aplicativo.
- **components**: Componentes compartilhados pelos diferentes módulos do aplicativo.
- **metrics**: Constantes que definem valores de espaçamentos.
- **storage**: Configurações e arquivos relacionados ao armazenamento local.

### Diretório `routes` (lib/src/routes)
- Define as rotas das telas do aplicativo.

### Diretório `http` (lib/src/http)
- Configuração da dependência `dio` para a comunicação HTTP com sistemas externos.

### Diretório `initial/page` (lib/src/modules/initial/page)
- Tela de inicialização do aplicativo com redirecionamento automático para a home e animação.

### Diretório `home` (lib/src/modules/home)
- **components**: Componentes específicos da página Home.
- **controller**: Controla a lógica da página usando MobX.
- **model**: Estrutura de dados para a resposta da API.
- **page**: Gerencia o estado da página Home.
- **repositories**: Comunicação com a API externa e armazenamento local.
- **service**: Implementa as regras de negócio e obtém dados dos repositórios.

### Diretório `history` (lib/src/modules/history)
- **controller**: Controla a lógica da página de histórico.
- **page**: Gerencia o estado da página de histórico.

## Funcionalidades
- Consulta de CEP utilizando a API externa.
- Exibição do local correspondente ao CEP consultado.
- Histórico de consultas.
- Animação na tela de inicialização.

## Dependências
- Flutter
- Dio
- MobX
- Flutter MobX

## Como Executar
1. Clone o repositório.
2. Instale as dependências com `flutter pub get`.
3. Execute o aplicativo com `flutter run`.

## Captura de Tela

!Página Home

## Contribuição
Sinta-se à vontade para contribuir com o projeto. Faça um fork do repositório, crie uma branch para suas alterações e envie um pull request.

## Licença
Este projeto está licenciado sob a licença MIT.

