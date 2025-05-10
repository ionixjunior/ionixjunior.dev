+++
title = "Git Cherry-Pick: Aplicando Commits de Forma Seletiva"
date = 2024-03-29
type = "post"
slug = "git-cherry-pick-selectively-applying-commits"
aliases = ["/git-cherry-pick-selectively-applying-commits"]
translationKey = "git-cherry-pick-selectively-applying-commits"
categories = ["TODO"]
tags = ["git"]
image = "/img/cards/git-cherry-pick-selectively-applying-commits.pt.webp"
+++

Cherry-picking no Git é uma técnica poderosa que permite escolher commits específicos de um branch e aplicá-los a outro. Isso pode ser particularmente útil quando você deseja trazer mudanças individuais de um branch para outro sem mesclar o branch inteiro. Neste post, veremos como esse comando funciona!

## Compreendendo o git cherry-pick
O comando `git cherry-pick` é uma ferramenta poderosa no Git que permite selecionar **commits específicos** de um branch e aplicá-los a outro branch. Essa **abordagem seletiva** para integrar commits permite que os desenvolvedores incorporem conjuntos de alterações individuais em sua base de código sem mesclar branches inteiros.

Quando você executa `git cherry-pick <hash-do-commit>`, o Git identifica o commit especificado e copia suas alterações para o branch atual. Esse processo efetivamente replica as alterações do commit, criando um novo commit com um hash distinto.

O cherry-picking é particularmente útil quando você precisa incorporar mudanças específicas de um branch em outro sem trazer commits não relacionados. Essa abordagem direcionada para a integração de commits ajuda a manter um **histórico de commit limpo e focado**, facilitando o rastreamento e a compreensão da evolução da base de código.

Suponha que você identificou uma **correção crítica de bug** em um branch de recurso que precisa ser aplicada ao branch de desenvolvimento principal. Em vez de mesclar o branch de recurso inteiro, que pode conter alterações adicionais que não estão prontas para integração, você pode fazer cherry-pick do commit de correção de bug e aplicá-lo diretamente ao branch principal. Isso garante que apenas as alterações necessárias sejam incorporadas, minimizando o risco de introduzir modificações não intencionais.

Da mesma forma, o cherry-picking pode ser usado para retroportar correções de bugs seletivamente ou aplicar recursos específicos a diferentes branches, como um branch de lançamento estável. Ao fazer cherry-pick de commits individuais, você tem controle detalhado sobre quais alterações são incluídas em cada branch, permitindo atualizações direcionadas e uma **gestão eficiente de código**.

## Exemplo de uso
Suponha que você tenha um branch de recurso onde fez algumas mudanças e commits. Agora, você deseja trazer apenas um desses commits para o seu branch principal:

```bash
git cherry-pick <hash-do-commit>
```

Este comando levará o commit do seu branch de recurso e o aplicará ao seu branch atual. Às vezes, ao fazer cherry-pick de um commit, o Git pode encontrar conflitos se as alterações no commit entrarem em conflito com as alterações no branch atual. Nesses casos, o Git pausará o processo de cherry-pick e pedirá que você resolva os conflitos manualmente.

## Conclusão
Normalmente, uso este comando quando estou fazendo grandes mudanças na base de código e preciso dividi-las em diferentes pull requests para que meus colegas de equipe as revisem. Consigo fazer isso porque geralmente faço vários commits quando estou desenvolvendo, normalmente um para cada mudança significativa que faço no código, e isso facilita o processo de cherry-pick. O cherry-picking é uma ferramenta valiosa no Git para **aplicar commits seletivamente** de um branch para outro. Ele permite trazer mudanças individuais sem mesclar branches inteiros, proporcionando mais **controle granular** sobre o histórico do seu projeto. Então, da próxima vez que precisar incorporar mudanças específicas de um branch em outro, recorra ao comando `git cherry-pick` e use seu poder seletivo com confiança!
