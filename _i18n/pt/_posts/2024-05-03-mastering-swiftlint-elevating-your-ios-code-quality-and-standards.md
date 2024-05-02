---
layout: post
title:  "Entendendo o SwiftLint: Elevando a Qualidade e Padrões do seu Código iOS"
date:   2024-04-23
translations: ["en"]
tags: ["iOS"]
---

<p class="intro"><span class="dropcap">F</span>azer lint no código é uma prática crucial no desenvolvimento de software, com o objetivo de manter a qualidade do código identificando erros, bugs e inconsistências estilísticas no início do processo de desenvolvimento. No desenvolvimento iOS, o SwiftLint se destaca como uma ferramenta valiosa para impor padrões de codificação e garantir consistência em projetos. Este post explora o papel do SwiftLint em elevar a qualidade do código iOS e otimizar os fluxos de trabalho de desenvolvimento. Vamos mergulhar no mundo do lint de código com o SwiftLint e descobrir seus benefícios para pessoas desenvolvedoras iOS.</p>

## Apresentando o SwiftLint
O SwiftLint é uma ferramenta poderosa que traz capacidades de lint de código para o desenvolvimento iOS, garantindo a conformidade com padrões de codificação e melhores práticas. Como parte de uma ampla família de linters disponíveis para várias linguagens de programação, o SwiftLint se concentra especificamente em bases de código Swift, oferecendo um conjunto de regras e diretrizes adaptadas para aprimorar a qualidade e a manutenibilidade do código.

O SwiftLint oferece um conjunto robusto de recursos projetados para aprimorar a qualidade e a manutenibilidade do código em projetos Swift. Com suas regras personalizáveis, as pessoas desenvolvedores podem adaptar as configurações de lint para atender aos requisitos específicos do projeto, garantindo a conformidade com padrões de codificação e melhores práticas. O SwiftLint se integra perfeitamente a ambientes de desenvolvimento populares, fornecendo feedback e sugestões em tempo real para simplificar o processo de codificação. Além disso, seu suporte para correção automática simplifica a tarefa de resolver violações de código, permitindo que consigamos nos concentrar em escrever código limpo e eficiente. No geral, o SwiftLint capacita os desenvolvedores a escrever um código melhor identificando problemas potenciais no início do ciclo de desenvolvimento e promovendo a consistência em toda a base de código.

## Como o SwiftLint funciona
O SwiftLint funciona analisando os arquivos de código-fonte Swift e aplicando um conjunto de regras predefinidas ou personalizadas para identificar violações de padrões de codificação e melhores práticas. Quando executado, o SwiftLint examina os arquivos ou diretórios especificados em um projeto Swift, analisando o código e verificando-o em relação às regras configuradas. Se forem encontradas violações, o SwiftLint gera um relatório destacando as linhas de código ofensivas juntamente com uma descrição da regra que foi violada.

## Entendendo as regras do SwiftLint
As regras do SwiftLint definem os critérios para qualidade de código e estilo dentro de um projeto Swift. Essas regras abrangem vários aspectos de padrões de codificação, incluindo formatação, convenções de nomenclatura e melhores práticas. Ao aderir a essas regras, os desenvolvedores podem garantir consistência e legibilidade em todo o código. O SwiftLint fornece uma lista abrangente de regras predefinidas, mas também permite que os desenvolvedores personalizem e estendam essas regras para melhor atender às necessidades do projeto.

Existem muitas regras de diferentes tipos. Regras sobre estilo, desempenho, métricas são alguns exemplos. Você pode verificar o [diretório de regras][rules_directory] para ver. Se você quiser implementar isso em seu projeto Swift, é uma boa estratégia habilitar uma regra de cada vez e executar o SwiftLint para verificar as violações. Projetos antigos podem ter dezenas de violações, então é importante avançar lentamente e refatorar. Se o seu projeto for mais recente, ou tiver pouco código, você pode habilitar todas por padrão.

Vamos ver como instalar e configurar.

## Instalando o SwiftLint
No [projeto SwiftLint][swiftlint_project], você pode encontrar instruções para instalá-lo. Você pode instalar através do Swift Package Manager, Homebrew, CocoaPods, Mint ou Bazel. Eu prefiro usar o Homebrew porque me dá mais flexibilidade para executar o SwiftLint em qualquer projeto. Claro, eu preciso configurá-lo primeiro, mas como eu gosto de uma linha de comando, prefiro ter o SwiftLint no meu terminal globalmente. É uma preferência. Escolha o que você acha que é o melhor para você.

## Executando o SwiftLint
Para fazer um teste simples, usei o [repositório BookTracking][book_tracking_repository]. Alguns de vocês devem se lembrar dele porque já usei ele em alguns exemplos. Basta abrir o terminal e digitar `swiftlint`, e para minha surpresa, muitas violações foram encontradas. Vou mostrar apenas parte do relatório porque tem mais de mil linhas.

{%- highlight sh -%}
swiftlint 

Linting Swift files in current working directory
Linting 'ConstraintMultiplierTarget.swift' (1/79)
Linting 'LayoutConstraintItem.swift' (2/79)
Linting 'ConstraintAttributes.swift' (4/79)
Linting 'ConstraintMakerPrioritizable.swift' (3/79)
Linting 'ConstraintViewDSL.swift' (5/79)
Linting 'ConstraintDescription.swift' (6/79)
Linting 'ConstraintPriorityTarget.swift' (7/79)
Linting 'ConstraintInsets.swift' (8/79)
/Users/ionixjunior/Projects/iOS/BookTracking/Pods/SnapKit/Sources/ConstraintInsets.swift:30:1: warning: Vertical Whitespace Violation: Limit vertical whitespace to a single empty line; currently 2 (vertical_whitespace)
/Users/ionixjunior/Projects/iOS/BookTracking/Pods/SnapKit/Sources/ConstraintPriorityTarget.swift:32:1: warning: Trailing Whitespace Violation: Lines should not have trailing whitespace (trailing_whitespace)
Linting 'ReadingViewController.swift' (46/79)
/Users/ionixjunior/Projects/iOS/BookTracking/BookTracking/ViewControllers/Reading/ReadingViewController.swift:77:1: warning: Line Length Violation: Line should be 120 characters or less; currently it has 130 characters (line_length)
/Users/ionixjunior/Projects/iOS/BookTracking/BookTracking/ViewControllers/Reading/ReadingViewController.swift:97:1: warning: Trailing Newline Violation: Files should have a single trailing newline (trailing_newline)
/Users/ionixjunior/Projects/iOS/BookTracking/BookTracking/ViewControllers/Reading/ReadingViewController.swift:14:1: warning: Trailing Whitespace Violation: Lines should not have trailing whitespace (trailing_whitespace)
Linting 'TabBarViewController.swift' (61/79)
/Users/ionixjunior/Projects/iOS/BookTracking/BookTracking/ViewControllers/TabBar/TabBarViewController.swift:58:71: warning: Colon Spacing Violation: Colons should be next to the identifier when specifying a type and next to the key in dictionary literals (colon)
/Users/ionixjunior/Projects/iOS/BookTracking/BookTracking/ViewControllers/TabBar/TabBarViewController.swift:13:9: warning: Identifier Name Violation: Variable name 'vc' should be between 3 and 40 characters long (identifier_name)
Linting 'AppDelegate.swift' (77/79)
/Users/ionixjunior/Projects/iOS/BookTracking/BookTracking/AppDelegate.swift:48:1: warning: Vertical Whitespace Violation: Limit vertical whitespace to a single empty line; currently 2 (vertical_whitespace)
Done linting! Found 929 violations, 61 serious in 79 files.
{%- endhighlight -%}

Caramba, muitas violações! Mas eu não configurei nada. Como o SwiftLint descobriu tudo isso? O SwiftLint apenas usa todas as regras padrão que possui. Outra coisa interessante é que ele fez o lint de um pod chamado SnapKit. Isso não é interessante para nós. Não precisamos fazer o lint das dependências. Precisamos definir e organizar como lidar com isso. Por isso é importante configurar nosso arquivo de lint. Vamos fazer isso!

## Configurando o SwiftLint
Primeiro, vamos criar o arquivo `.swiftlint.yml`. Ele precisa começar com "ponto" porque é um arquivo oculto. Depois disso, vamos configurar nossas pastas e arquivos excluídos. No meu projeto, configurei a pasta `Pods` para que o SwiftLint não analise minhas bibliotecas externas, porque estou usando dependências do CocoaPods.

{%- highlight yml -%}
excluded:
  - Pods/
{%- endhighlight -%}

Executando o comando `swiftlint` agora o resultado é muito melhor, porque o diretório `Pods` não é mais analisado. Agora tenho "apenas" 364 violações no meu projeto.

Você tem que escolher uma estratégia para lidar com isso. Você pode manter o arquivo swiftlint desta forma e resolver todas as violações que ele encontrou, ou pode aprender sobre todas as regras e escolher o que é interessante para você ou para seu projeto. Vou manter todas as regras ativadas neste momento e tentarei resolver as violações do meu projeto. Mas vou te mostrar como fazer algumas configurações. Suponha que você escolha especificar apenas algumas regras específicas, você precisa usar a propriedade `only_rules` e especificar as regras:

{%- highlight yml -%}
only_rules:
  - multiline_arguments
  - overridden_super_call

excluded:
  - Pods/
{%- endhighlight -%}

Além disso, você pode configurar algumas regras desabilitadas para evitar que o SwiftLint as analise. 

{%- highlight yml -%}
disabled_rules:
  - trailing_whitespace

excluded:
  - Pods/
{%- endhighlight -%}

Esses são apenas exemplos. Sugiro que você execute o comando `swiflint rules` para ver todas as regras disponíveis. Na tabela que aparecerá na linha de comando, você pode ver se a regra pode ser corrigida automaticamente (é possível), o tipo da regra (lint, idiomático, estilo, métricas ou desempenho), a configuração padrão e algumas outras informações.

Estamos executando o SwiftLint a partir da linha de comando, mas existe uma maneira de integrá-lo ao Xcode e ver avisos ou erros em cada compilação. Vamos aprender sobre isso!

## Integrando o SwiftLint ao Xcode
Fazer isso é muito simples. Você precisa adicionar uma "Run Script Phase" no projeto Xcode. Abra o Xcode e siga estas etapas:
1. Selecione seu projeto no Navegador de Projetos para abrir o editor de projetos;
2. Selecione o alvo ao qual deseja adicionar a integração do SwiftLint;
3. Vá para a aba "Build Phases";
4. Clique no botão "+" e selecione "New Run Script Phase";
5. No campo de texto do script, insira o comando para executar o SwiftLint. No meu caso, adicionei o swiftlint que instalei com o Homebrew: `/opt/homebrew/bin/swiftlint`.

<figure>
	<img src="/assets/img/steps_how_to_configure_swiftlint_into_xcode_part_I.png" alt="Passos de como configurar o SwiftLint no Xcode."> 
	<figcaption>Passos de como configurar o SwiftLint no Xcode.</figcaption>
</figure>

Depois disso, mova a fase "Run Script" antes da fase "Compile Sources". Basta arrastar e soltar na interface do Xcode.

<figure>
	<img src="/assets/img/steps_how_to_configure_swiftlint_into_xcode_part_II.gif" alt="Movendo a fase Run Script antes da fase Compile Sources."> 
	<figcaption>Movendo a fase Run Script antes da fase Compile Sources.</figcaption>
</figure>

Então, você poderá compilar seu projeto e ficar feliz usando o SwiftLint diretamente no Xcode. No meu caso, o projeto não compila por causa de uma violação chamada `line_length`. Infelizmente, tomei algumas decisões ruins ao prototipar dados diretamente em uma classe e isso violou facilmente essa regra. Para compilar meu aplicativo novamente, apenas removi esta regra agora para eu conseguir seguir em frente com a compilação e depois eu voltarei para resolver este problema.

## Corrigindo as violações
Em meu projeto, encontrei 364 violações. Comecei apenas corrigindo da maneira mais fácil: usando a autocorreção. O SwiftLint fornece uma maneira de corrigir automaticamente algumas regras. Para fazer isso, execute o seguinte comando:

{%- highlight sh -%}
swiftlint --autocorrect
{%- endhighlight -%}

No meu projeto, a ferramenta corrigiu automaticamente regras simples, como `trailing_whitespace`, `trailing_newline`, `trailing_comma`, `unneeded_override`, `colon`, `comma` e `opening_brace`. Novamente, são regras muito simples, mas podem manter seu projeto padronizado. Algumas regras como `identifier_name` e `function_body_length` eu precisei corrigir manualmente.

## Conclusão
Integrar o SwiftLint ao seu fluxo de trabalho de desenvolvimento iOS pode melhorar significativamente a qualidade do seu código ao impor padrões de codificação consistentes e identificar problemas potenciais no início do processo de desenvolvimento. Ao aproveitar o extenso conjunto de regras personalizáveis do SwiftLint e sua integração perfeita com ambientes de desenvolvimento populares como o Xcode, você pode garantir que sua base de código permaneça limpa, manutenível e livre de armadilhas comuns.

Se você é um desenvolvedor iOS experiente ou está apenas começando, entender o SwiftLint e adotar uma abordagem proativa para o lint de código elevará a qualidade de seus projetos iOS e contribuirá para uma experiência de desenvolvimento mais eficiente e colaborativa. Portanto, não hesite em incorporar o SwiftLint ao seu toolkit e elevar suas práticas de desenvolvimento iOS para o próximo nível, mesmo que seu projeto seja novo. Isso ajudará você a garantir que seu projeto tenha bons padrões.

Vejo você no próximo post!

[rules_directory]:          https://realm.github.io/SwiftLint/rule-directory.html
[swiftlint_project]:        https://github.com/realm/SwiftLint
[book_tracking_repository]: https://github.com/ionixjunior/BookTracking