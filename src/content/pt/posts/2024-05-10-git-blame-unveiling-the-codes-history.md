+++
title = "Git Blame: Revelando a História do Código"
date = 2024-05-10
tags = ["git"]
social_image: "git-blame-unveiling-the-codes-history.pt.webp"
+++

<p class="intro"><span class="dropcap">J</span>á se deparou com um trecho de código e se perguntou: "Quem escreveu isso?" ou "Quando isso foi alterado?". Não tema, querido(a) desenvolvedor(a), pois o "git blame" está aqui para o resgate! Este poderoso comando age como um detetive, revelando a história por trás de cada linha de código em seu repositório Git. Vamos mergulhar nisso no post de hoje.</p>

O comando `git blame` é sua ferramenta ideal para entender a evolução de sua base de código. Ele permite que você identifique o autor, a data/hora e o commit associado à última modificação em cada linha de um arquivo específico. Essas informações são inestimáveis para diversos propósitos, desde rastrear a origem de bugs até atribuir responsabilidades e obter insights sobre o processo de desenvolvimento. Vamos ver como funciona.

## Como o git blame funciona
Este comando mostra na linha de comando anotações para cada linha de um arquivo específico, fornecendo informações sobre o último commit que a alterou. Ele também exibe o hash do commit, o autor e a data/hora.

## Exemplos de como usar o git blame
O comando `git blame` é muito versátil. Vamos explorar alguns usos diferentes.

### Uso básico
Digamos que você esteja trabalhando com um arquivo Swift chamado `User.swift` e queira saber a história por trás de suas linhas. Abra seu terminal, navegue até o diretório raiz do seu repositório e execute o seguinte comando, referenciando o arquivo do seu projeto:

{%- highlight txt -%}
git blame User.swift
{%- endhighlight -%}

Isso exibirá uma saída semelhante a esta:

{%- highlight txt -%}
96d864ac (John Doe   2023-08-15 10:30:01 -0400 1) struct User {
96d864ac (John Doe   2023-08-15 10:30:01 -0400 2)     let id: Int
96d864ac (John Doe   2023-08-15 10:30:01 -0400 3)     let name: String
2b8f7a4c (Mary Smith 2023-08-08 16:22:10 -0400 4)     let email: String?
96d864ac (John Doe   2023-08-15 10:30:01 -0400 5) }
{%- endhighlight -%}

A primeira coluna mostra o hash abreviado do commit associado à última alteração em cada linha. A segunda coluna identifica o autor do commit. Aqui, vemos que John Doe e Mary Smith contribuíram para este arquivo. A terceira coluna mostra a data e hora do commit. A coluna final indica o número da linha no arquivo. Seguindo as informações acima, você verá o conteúdo real de cada linha no arquivo.

Ao analisar esta saída, você pode rastrear a evolução deste arquivo, ver quem fez alterações específicas e entender quando essas alterações ocorreram.

Isso analisa o arquivo no estado atual. Vamos ver como podemos fazer isso de uma maneira diferente.

### Analisando revisões específicas
Este comando permite que você mergulhe na história de um arquivo em um determinado momento ou commit. Isso é útil quando você deseja entender o estado do código em um marco específico ou investigar problemas que surgiram após certas alterações.

Imagine que você queira ver como o arquivo `User.swift` parecia no commit com o hash `fae4321b`. Você usaria o seguinte comando:

{%- highlight txt -%}
git blame fae4321b User.swift
{%- endhighlight -%}

A saída mostrará o estado do arquivo naquele commit específico, revelando quem criou cada linha e quando ela foi alterada pela última vez antes daquele ponto no histórico. 

Se você não estiver interessado em alterações mais antigas, você pode especificar um intervalo e isso pode ser feito de duas maneiras. A primeira que vou mostrar a você é através de uma tag. Suponha que tenhamos uma tag chamada `v123` e queremos ver as mudanças após esse tempo, só precisamos colocar dois pontos ".." após a tag:

{%- highlight txt -%}
git blame v123.. User.swift
{%- endhighlight -%}

Outra opção é usar o sinalizador `--since` especificando um período para conseguir isso:

{%- highlight txt -%}
git blame --since=2.weeks User.swift
{%- endhighlight -%}

Essas opções oferecem a flexibilidade de investigar o código em diferentes pontos de sua história, ajudando a identificar a introdução de bugs ou entender o contexto de alterações anteriores.

### Ignorando alterações de espaços em branco
Às vezes, as alterações em um arquivo envolvem apenas modificações de espaço em branco, como recuo ou quebras de linha. Embora essas alterações possam ser necessárias para formatação ou consistência de estilo, elas podem bagunçar a saída de `git blame` e tornar mais difícil focar em alterações de código significativas. 

Para desconsiderar alterações de espaço em branco ao analisar um arquivo, basta incluir o sinalizador `-w` em seu comando. Por exemplo:

{%- highlight txt -%}
git blame -w User.swift
{%- endhighlight -%}

### Saída personalizada
Há muitas opções disponíveis com este comando, mas mostrarei mais duas possibilidades, ambas relacionadas ao sinalizador `-L`.

Você pode analisar um arquivo especificando um intervalo de números de linha:

{%- highlight txt -%}
git blame -L 10,20 User.swift
{%- endhighlight -%} 

Este comando irá mostrar as linhas 10 a 20. Além disso, você pode especificar um nome de função, passando-o como uma regex no comando. Suponha que você queira analisar uma função chamada `func configConstraints() { ... }` neste arquivo, você pode executar o comando desta forma:

{%- highlight txt -%}
git blame -L /func\ configConstraints/ User.swift
{%- endhighlight -%}

Não é comum e às vezes não é fácil de fazer, mas é uma possibilidade, blz?

## Conclusão
O `git blame` é uma ferramenta inestimável no arsenal de qualquer pessoa desenvolvedora. Sua capacidade de revelar a história por trás de cada linha de código nos permite entender como nossa base de código evoluiu, rastrear bugs e apreciar as contribuições dos colegas do time.

No entanto, é crucial usar este comando com responsabilidade e evitar criar uma cultura de culpa. Lembre-se de que cada mudança, mesmo aquelas que introduziram problemas, serviu a um propósito em um determinado momento. Em vez de apontar o dedo, use o `git blame` como uma ferramenta para aprendizado, colaboração e melhoria de sua base de código. 

Ao entender o contexto por trás de cada modificação e promover a comunicação aberta, você pode aproveitar o poder do `git blame` para criar um ambiente de desenvolvimento mais produtivo e positivo.

Até o próximo post!