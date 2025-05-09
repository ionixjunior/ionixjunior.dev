+++
title = "Git Reset e Git Revert: Gerenciando Erros no Git"
date = 2024-03-22
type = "post"
categories = ["TODO"]
tags = ["git"]
social_image: "git-reset-and-git-revert-managing-mistakes-in-git.pt.webp"
+++

<p class="intro"><span class="dropcap">N</span>a jornada do desenvolvimento de software, os erros são inevitáveis. Seja uma linha de código mal posicionada ou um commit equivocado, todo desenvolvedor já enfrentou a sensação angustiante que acompanha um erro em seu trabalho. No entanto, no mundo dos sistemas de controle de versão, como o Git, esses passos em falso não precisam significar um desastre. Git reset e Git revert servem como faróis de esperança em meio ao mar tumultuado de mudanças de código, oferecendo aos desenvolvedores os meios para corrigir erros, retroceder em decisões equivocadas e direcionar seus projetos de volta ao curso correto. Neste post, vamos explorar as nuances do Git reset e Git revert, descobrindo suas capacidades e nos armando com o conhecimento necessário para navegar pelas águas agitadas do controle de versão com confiança. Então, vamos mergulhar e descobrir como Git reset e Git revert podem ser nossos companheiros firmes na busca por código impecável e colaboração perfeita.</p>

## Compreendendo o git reset
Git reset é um comando versátil que permite aos desenvolvedores manipular o estado da área de preparação (staging) e diretório de trabalho do seu repositório. Em sua essência, Git reset serve como uma ferramenta para desfazer alterações e redefinir o HEAD atual para um estado especificado. No entanto, sua funcionalidade se estende muito além do mero desfazer, oferecendo aos desenvolvedores uma variedade de opções para navegar pela história de seus projetos e gerenciar a progressão dos commits.

Uma das funções principais do Git reset é mover o ponteiro HEAD para um commit diferente, efetivamente redefinindo o estado do repositório para aquela snapshot específica no tempo. Esta ação pode ser realizada com vários graus de granularidade, permitindo que os desenvolvedores redefinam o HEAD para um commit específico, branch, ou até mesmo para um estado anterior do diretório de trabalho. Vamos ver o comando e suas principais variações.

### Movendo HEAD para um commit específico
Git reset move o ponteiro HEAD para o commit especificado, redefinindo a área de preparação e o diretório de trabalho para corresponder ao estado desse commit. As alterações feitas após este commit serão removidas da área de preparação. Todos os arquivos que você alterou entre o ponteiro que você move e o ponteiro que estava antes sairão da área de preparação.

{%- highlight bash -%}
git reset <commit-hash>
{%- endhighlight -%}

### Soft reset
Soft reset move o ponteiro HEAD para o commit especificado enquanto preserva as alterações na área de preparação. Isso permite que você faça novamente o commit das alterações ou faça modificações adicionais antes de realizar o commit.

{%- highlight bash -%}
git reset --soft <commit-hash>
{%- endhighlight -%}

### Hard reset
Um hard reset move o ponteiro HEAD para o commit especificado e redefine tanto a área de preparação quanto o diretório de trabalho para corresponder ao commit. Todas as alterações feitas após este commit serão descartadas permanentemente.

{%- highlight bash -%}
git reset --hard <commit-hash>
{%- endhighlight -%}

Hard reset com HEAD como argumento descarta todas as alterações locais e redefine o diretório de trabalho para corresponder ao commit atual. Isso é útil para reverter para um estado limpo sem preservar quaisquer modificações.

{%- highlight bash -%}
git reset --hard HEAD
{%- endhighlight -%}

### Removendo alterações da área de preparação
Suponha que você já colocou algumas alterações na área de preparação e deseja movê-las para a área de trabalho. O seguinte comando remove o arquivo especificado da área de preparação enquanto preserva as alterações no diretório de trabalho.

{%- highlight bash -%}
git reset HEAD <arquivo>
{%- endhighlight -%}

Também é possível omitir o nome do arquivo para aplicar o comando a todos os arquivos na área de preparação.

## Compreendendo o git revert
Enquanto `git reset` modifica o histórico de commits movendo o HEAD e as referências de branch para um commit específico, `git revert` adota uma abordagem diferente. Em vez de alterar o histórico de commit, `git revert` cria um novo commit que desfaz as alterações introduzidas por um commit especificado.

{%- highlight bash -%}
git revert <commit-hash>
{%- endhighlight -%}

Quando você executa o comando acima, o Git criará um novo commit que aplica inversamente as alterações feitas por um commit especificado. Isso efetivamente desfaz as alterações introduzidas por esse commit sem alterar o histórico de commits. É importante observar que `git revert` opera no diretório de trabalho e na área de preparação, criando um novo commit com alterações que revertem aquelas introduzidas por um commit especificado.

Por exemplo, suponha que você tenha um commit com hash "abc123" que introduziu um bug, e você deseja desfazer as alterações introduzidas por esse commit. Você pode usar `git revert abc123` para criar um novo commit que desfaz as alterações feitas por "abc123", efetivamente corrigindo o bug sem alterar o histórico de commit.

Ao contrário de `git reset`, que pode ser usado para retroceder o histórico de commit, `git revert` é mais adequado para desfazer commits específicos enquanto preserva a integridade do histórico de commits. É uma opção mais segura ao trabalhar em repositórios compartilhados ou quando você precisa manter um histórico de commit limpo e linear.

Você pode reverter mais de um commit por vez.

{%- highlight bash -%}
git revert <commit-hash-1> <commit-hash-2>
{%- endhighlight -%}

Ou reverter um intervalo de commits, do mais antigo para o mais recente.

{%- highlight bash -%}
git revert <oldest-commit-hash> <newest-commit-hash>
{%- endhighlight -%}

## Git reset vs. git revert: escolhendo a ferramenta certa
Para aqueles que preferem recursos visuais, aqui está uma tabela destacando as principais distinções entre os comandos.

| Recurso           | git reset                                 | git revert                                      |
|-------------------|---------------------------------------------|---------------------------------------------------|
| Operação          | Reescreve o histórico de commits                     | Cria um novo commit com as mudanças revertidas              |
| Efeito no histórico | Retrocede para um commit específico               | Reverte as alterações do commit especificado       |
| Hash do commit    | Move o HEAD e a referência de branch        | Cria um novo commit com as alterações revertidas   |
| Colaboração      | Pode ser disruptivo em repositórios compartilhados  | Seguro para repositórios compartilhados, preserva o histórico |
| Caso de uso      | Desfazer alterações locais ou preparar para recommit | Reverter alterações no histórico compartilhado       |
| Perda de histórico | Pode resultar na perda de alterações que não possuem commit | Preserva o histórico de commit, cria um novo commit de reversão |

## Aproveitando os poderes de desfazer do Git
No mundo do desenvolvimento de software, erros são inevitáveis, mas não precisam ser permanentes. Com os poderosos comandos "reset" e "revert" do Git à sua disposição, você detém as chaves para gerenciar erros e navegar pela história do seu projeto com confiança. Ao entender as nuances de cada comando e aplicar as melhores práticas, você pode utilizar as capacidades de viagem no tempo do Git a seu favor, garantindo um processo de desenvolvimento mais suave e eficiente. Portanto, abrace o poder do Git, aprenda com seus erros e continue sua jornada rumo a se tornar um guru do Git.
