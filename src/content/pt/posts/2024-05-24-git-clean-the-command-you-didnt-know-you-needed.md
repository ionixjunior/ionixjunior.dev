+++
title = "Git Clean: O Comando Que Você Não Sabia Que Precisava"
date:   2024-05-24
translations: ["en"]
tags: ["git"]
social_image: "git-clean-the-command-you-didnt-know-you-needed.pt.webp"
+++

<p class="intro"><span class="dropcap">I</span>magine um repositório Git bagunçado, cheio de arquivos não rastreados, artefatos de compilação e arquivos temporários. Qual a melhor maneira de remover todo esse conteúdo indesejado e manter o repositório limpo, liberando espaço do seu computador? O Git oferece um comando chamado git clean e aprenderemos sobre ele neste post. Vamos descobrir o comando que você não sabia que precisava!</p>

## O que é o Git Clean?

Em termos simples, `git clean` remove arquivos não rastreados do seu diretório de trabalho. Isso é útil para reduzir a desordem, otimizar o desenvolvimento, evitar conflitos e melhorar a experiência geral do Git.  Muitos projetos geram caches, binários ou baixam bibliotecas externas que podem ocupar muito espaço. Este comando ajuda a limpar todo o repositório. 

Não se preocupe, `git clean` não toca em arquivos rastreados (arquivos já adicionados ou comitados). 

## Como Usar o Git Clean

O comando é muito simples de usar. Basta digitar `git clean` na linha de comando seguido de alguns parâmetros. Aqui estão os principais:

- **-d**: Remove diretórios não rastreados recursivamente.
- **-i**: Usa o modo interativo. O Git mostrará todos os arquivos ou diretórios a serem limpos, e você precisará escolher quais remover.
- **-f**: Força o `git clean` a limpar o repositório. Por padrão, o Git não limpa nada, a menos que você especifique este parâmetro ou use o modo interativo. Você pode alterar esse comportamento definindo a configuração do Git `clean.requireForce` para `false`. Para mais informações sobre configuração do Git, consulte o [post sobre o Git Básico][git_basics_post].
- **-X**: Remove apenas arquivos ignorados pelo Git usando o arquivo `.gitignore`.

Você pode combinar esses parâmetros para realizar diferentes operações de limpeza. Após a execução, você verá uma lista de arquivos excluídos.

{%- highlight txt -%}
git clean -dfX

Removing .DS_Store
Removing BookTracking.xcodeproj/xcuserdata/ionixjunior.xcuserdatad/xcschemes/
Removing BookTracking.xcworkspace/xcshareddata/
Removing BookTracking.xcworkspace/xcuserdata/ionixjunior.xcuserdatad/UserInterfaceState.xcuserstate
Removing Pods/
{%- endhighlight -%}

O `git clean` é muito simples de usar e extremamente útil para liberar espaço, especialmente em projetos mais antigos nos quais você não está trabalhando ativamente.

## Conclusão

Embora simples, `git clean` é incrivelmente útil. Muitas vezes, excluímos arquivos manualmente, mas este comando vem em nosso auxílio. Se você deseja liberar espaço ou ter um diretório de trabalho limpo para recompilar seu projeto sem se preocupar com arquivos em cache, `git clean` é a sua solução. Pare de fazer as coisas manualmente e use o poder do Git para lhe auxiliar todos os dias.

Até o próximo post!

[git_basics_post]: /git-basics-an-in-depth-look-at-essential-commands/