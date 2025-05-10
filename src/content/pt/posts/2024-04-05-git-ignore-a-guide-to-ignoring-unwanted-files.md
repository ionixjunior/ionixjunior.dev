+++
title = "Git Ignore: Um Guia para Ignorar Arquivos Indesejados"
date = 2024-04-05
type = "post"
slug = "git-ignore-a-guide-to-ignoring-unwanted-files"
aliases = ["/git-ignore-a-guide-to-ignoring-unwanted-files"]
translationKey = "git-ignore-a-guide-to-ignoring-unwanted-files"
categories = ["TODO"]
tags = ["git"]
image = "/img/cards/git-ignore-a-guide-to-ignoring-unwanted-files.pt.webp"
+++

Embora Git ignore não seja um comando, é uma ferramenta essencial para manter seus projetos organizados. Ao especificar arquivos e diretórios a serem ignorados, você pode evitar bagunça e garantir que apenas arquivos relevantes sejam mantidos em seu repositório. Neste guia, exploraremos o Git ignore e como ele simplifica seu fluxo de trabalho excluindo arquivos indesejados.

## Compreendendo o git ignore
O Git ignore é um recurso no Git que permite especificar arquivos e diretórios que devem ser ignorados pelo controle de versão. Esses arquivos ignorados não serão rastreados ou preparados, facilitando o foco nos arquivos mais importantes em seu projeto.

Quando você cria um arquivo `.gitignore` em seu repositório, você pode listar padrões para arquivos ou diretórios que deseja que o Git ignore. Esses padrões podem incluir nomes de arquivos, nomes de diretórios ou padrões de caractere curinga para corresponder a vários arquivos ou diretórios.

Por exemplo, você pode querer ignorar arquivos temporários gerados pelo seu ambiente de desenvolvimento, artefatos de compilação ou arquivos contendo informações sensíveis como senhas ou chaves de API. Ao especificar esses padrões em seu arquivo `.gitignore`, você pode manter seu repositório limpo e evitar que arquivos desnecessários sejam incluídos em seus commits.

Compreender como usar efetivamente o Git ignore é essencial para manter um repositório limpo e organizado. Isso ajuda a garantir que apenas arquivos relevantes sejam rastreados pelo Git, reduzindo a bagunça e simplificando a colaboração com outros desenvolvedores.

## Usando o arquivo git ignore
Para usar este recurso, basta criar um novo arquivo de texto em seu diretório de projeto e nomeá-lo `.gitignore`. Você pode usar qualquer editor de texto para criar e editar este arquivo.

No arquivo `.gitignore`, você pode adicionar padrões para arquivos ou diretórios que deseja que o Git ignore. Cada padrão deve estar em uma linha separada. Você pode usar caracteres curinga como `*` para corresponder a vários arquivos ou diretórios, e você pode usar comentários começando com `#` para adicionar notas ou explicações.

Por exemplo, para ignorar todos os arquivos `.xcuserstate` e o diretório `Pods`, você pode adicionar as seguintes linhas ao seu arquivo `.gitignore`:

```txt
*.xcuserstate
Pods/
```

Esses padrões dirão ao Git para ignorar qualquer arquivo com a extensão `.xcuserstate` e todo o diretório `Pods`. Na desenvolvimento iOS, esses arquivos são desnecessários para adicionar ao controle de versão porque armazenam as informações de estado do usuário para o Xcode e as dependências gerenciadas pelo CocoaPods.

Depois de ter criado ou atualizado seu arquivo `.gitignore`, o Git começará automaticamente a ignorar os arquivos e diretórios especificados quando você executar operações como `git status`, `git add` ou `git commit`.

Criar um arquivo `.gitignore` cedo no desenvolvimento do seu projeto pode ajudar a evitar commits acidentais de arquivos indesejados e garantir que seu repositório permaneça limpo e organizado.

Uma coisa interessante é que você pode fazer uma negação para evitar que algum arquivo seja ignorado. Por exemplo, você pode configurar seu arquivo `.gitignore` para ignorar todos os arquivos `.txt` mas descartar algum arquivo específico com a mesma extensão.

```txt
*.txt
!important_file.txt
```

Ao aproveitar essas técnicas de correspondência de padrões, você pode criar regras `.gitignore` precisas para excluir arquivos e diretórios indesejados de seu repositório Git, garantindo um histórico de controle de versão mais limpo e gerenciável. 

Em todos os repositórios que você criar, você precisa especificar este arquivo. Mas você pode criar um arquivo `.gitignore` global para todos os projetos em sua máquina. Vamos aprender sobre essa opção.

## Usando git ignore globalmente
Usar um arquivo `.gitignore` global é uma maneira conveniente de ignorar certos arquivos e padrões em todos os seus repositórios Git em um sistema específico. Isso é especialmente útil para arquivos gerados comumente por ferramentas de desenvolvimento ou sistemas operacionais e que não são específicos de nenhum projeto em particular. Para configurar um arquivo `.gitignore` global, siga estas etapas:

1. Crie um arquivo global de ignore do Git: Comece criando um arquivo `.gitignore_global` em seu diretório principal ou em qualquer outra localização de sua escolha. O nome pode ser diferente também. Este arquivo conterá os padrões de ignore globais.
2. Defina os padrões de ignore: Adicione os padrões para arquivos ou diretórios que você deseja ignorar globalmente ao arquivo `.gitignore_global`. Você pode usar as mesmas técnicas de correspondência de padrões descritas anteriormente.
3. Configure o Git para usar o arquivo de ignore global: Diga ao Git para usar o arquivo `.gitignore_global` configurando a opção de configuração `core.excludesFile`. Execute o seguinte comando em seu terminal:

```bash
git config --global core.excludesFile ~/.gitignore_global
```

Substitua `~/.gitignore_global` pelo caminho para o seu arquivo de ignore global se estiver localizado em um diretório diferente.

Depois de configurar o arquivo `.gitignore_global` e configurar o Git para usá-lo, quaisquer padrões definidos no arquivo se aplicarão a todos os seus repositórios Git naquele sistema. Isso ajuda a garantir regras de ignore consistentes em projetos e evita que você adicione acidentalmente arquivos ou diretórios indesejados para seus repositórios.

## Dicas
Está cansado de criar um arquivo `.gitignore` para cada projeto? Você pode usar um repositório chamado [gitignore][gitignore_repo] mantido pelo GitHub. Este repositório contém uma coleção de modelos `.gitignore` para várias linguagens de programação, frameworks e ambientes de desenvolvimento. Você pode navegar pelo repositório e baixar manualmente o modelo relevante para o seu projeto ou usar a ferramenta de linha de comando fornecida pelo GitHub para buscar o arquivo `.gitignore` apropriado diretamente em seu repositório.

Está se sentindo preguiçoso? Tente usar o [Gitignore.io][gitignore_io]. Esta é uma ferramenta útil e bem prática para gerar arquivos `.gitignore` adaptados a linguagens de programação específicas, frameworks e ambientes de desenvolvimento. Pode economizar tempo e garantir que arquivos e diretórios comuns sejam devidamente ignorados.

## Conclusão
Git ignore é uma ferramenta fundamental para gerenciar os arquivos e diretórios do seu projeto dentro de um repositório Git. Ao especificar quais arquivos e diretórios ignorar, você pode manter seu repositório limpo e focado, evitando bagunça desnecessária e impedindo que arquivos sensíveis ou gerados sejam versionados de forma indesejada. Esteja você trabalhando em um pequeno projeto pessoal ou colaborando com uma grande equipe, dominar o Git ignore irá otimizar seu fluxo de trabalho e ajudá-lo a manter um processo de desenvolvimento mais organizado e eficiente. Portanto, aproveite o poder do Git ignore e assuma o controle do conteúdo do seu repositório com confiança!

[gitignore_repo]: https://github.com/github/gitignore
[gitignore_io]:   https://www.toptal.com/developers/gitignore/