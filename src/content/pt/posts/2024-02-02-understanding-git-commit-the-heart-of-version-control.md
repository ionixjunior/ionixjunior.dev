+++
title = "Entendendo o Git Commit: O Coração do Controle de Versão"
date = 2024-02-02
type = "post"
slug = "understanding-git-commit-the-heart-of-version-control"
translationKey = "understanding-git-commit-the-heart-of-version-control"
categories = ["TODO"]
tags = ["git"]
image = "/img/cards/understanding-git-commit-the-heart-of-version-control.pt.webp"
+++

No mundo do controle de versão, o Git commit é mais do que um simples registro de alteração; é a evolução do seu projeto. Cada commit é uma nota deliberada na sinfonia do desenvolvimento, encapsulando mudanças, decisões e progresso. Texto bonito, né? rsrs. Te garanto que o texto também tá bem legal e pode te dar algumas dicas para o dia a dia. Junte-se a mim enquanto desvendamos a essência do Git commit — compreendendo seus componentes, dominando a arte de mensagens concisas e apreciando seu papel fundamental na formação de uma versão coerente na história do projeto.

O **Git commit**, uma captura do estado do seu projeto, é mais do que aparenta. Vamos explorar sua anatomia, entendendo seus elementos.

### Anatomia de um commit do Git
Cada commit contém quatro elementos principais: Hash, autor, data e hora do commit e a mensagem.

O hash é uma impressão digital criptográfica que garante a integridade dos dados. Esse hash, frequentemente expresso como uma série de caracteres, serve como uma etiqueta distintiva para cada commit, permitindo que o Git mantenha um registro preciso das mudanças.

A autoria de um commit é um aspecto fundamental, revelando quem introduziu mudanças específicas. O Git captura e atribui a identidade do autor, promovendo responsabilidade e transparência no desenvolvimento colaborativo.

A data e hora do commit, contribui com contexto histórico para a evolução do projeto. Essa informação temporal ajuda as pessoas desenvolvedoras a rastrear a linha do tempo das mudanças, proporcionando insights sobre quando modificações específicas foram integradas ao código-fonte.

Finalmente, a mensagem do commit surge como o fio narrativo que une tudo. Mais do que uma descrição, uma mensagem de commit bem elaborada é um resumo conciso e abrangente das mudanças introduzidas. Mensagens de commit eficazes aprimoram a **colaboração** ao comunicar claramente o propósito e o impacto de cada commit, facilitando a compreensão suave da história de desenvolvimento do projeto. Se você quiser aprender a escrever boas mensagens de commit, sugiro a leitura [deste post][git_commit_post].

Vamos ver todos esses elementos no commit abaixo. O hash ao lado do texto `commit`, o autor do commit (Paulo Ricardo e seu e-mail), a data do commit e a mensagem na parte inferior.

{%- highlight diff -%}
commit 8934fac280ff394926df4746d31da52f431d52bf
Author: Paulo Ricardo <paulo@ricardo.dev>
Date: Sun Jan 14 18:14:34 2024 -0000

    Corrigir erro de digitação

{%- endhighlight -%}

### Uso Básico
Desde que os arquivos tenham sido adicionados à área de preparação, você pode começar a usar o comando `git commit`. Como escrevi no [post básico][git_basics_post], você pode fazer seu commit e adicionar um título à mensagem com o seguinte comando:

{%- highlight sh -%}
git commit -m "Título do seu commit"
{%- endhighlight -%}

Vamos explorar outras possibilidades.

### Alterar o Último Commit
Você faz commit dos seus arquivos e depois percebe um erro em sua mensagem de commit. Talvez haja erros de digitação, ou você deseja incluir mais detalhes. Mas como fazer isso se você já fez o commit? Não se preocupe! Você pode alterar facilmente seu último commit:

{%- highlight sh -%}
git commit --amend
{%- endhighlight -%}

Dessa forma, o Git abrirá o editor de texto padrão e você pode corrigir a mensagem do commit. Se quiser atualizar a mensagem sem usar o editor, você pode incluir a mensagem com o comando.

{%- highlight sh -%}
git commit --amend -m "Seu novo título"
{%- endhighlight -%}

Agora, pense na seguinte situação: você termina o commit e esquece de adicionar alguns arquivos. Precisa fazer outro commit? Não! Você pode adicionar esse arquivo à área de preparação usando `git add` e, em seguida, alterar seu último commit incluindo os novos arquivos. Mais uma coisa: se você não quiser alterar sua mensagem, pode especificar o parâmetro `--no-edit`, e o Git não solicitará nada.

{%- highlight sh -%}
git commit --amend --no-edit
{%- endhighlight -%}

Cuidado com a opção `--amend`, pois ela altera o hash do commit. Se o commit existir apenas em sua máquina, sem problemas. Mas se o commit já existir no repositório remoto (como GitHub, GitLab ou BitBucket), talvez seus colegas tenham dificuldade em atualizar o projeto depois de você enviar as alterações corrigidas para o repositório remoto.

### Incluir arquivos na área de preparação e realizar commit ao mesmo tempo
Se você se sentir confiante e planeja fazer commit de todos os arquivos alterados sem revisar nada (por favor, não faça isso), pode usar a opção `-a`. Esse parâmetro irá adicionar as alterações à área de preparação automaticamente antes do commit.

{%- highlight sh -%}
git commit -a -m "Título do commit"
{%- endhighlight -%}

Se preferir, pode juntar os parâmetros para simplificar.

{%- highlight sh -%}
git commit -am "Título do commit"
{%- endhighlight -%}

Já usei isso bastante. Muito fácil e simples, mas sem controle sobre o que está sendo adicionado ao repositório. Use com sabedoria.

### Commits Vazios
O quê? Isso não faz sentido! Sim, mas às vezes isso pode ser útil. Imagine que você está configurando o pipeline do seu projeto em uma plataforma CI/CD (como GitHub Actions, Azure DevOps, Bitrise, etc.), e precisa fazer algum commit para testar a trigger de execução do pipeline. O que você faria? Alteraria alguns arquivos e os enviaria para o repositório remoto? Isso vai funcionar, mas você pode fazer um commit sem alterar nada para não "sujar" o seu repositório.

{%- highlight sh -%}
git commit --allow-empty -m "Título do seu commit vazio"
{%- endhighlight -%}

### É Isso
Este foi mais um comando do Git para aprender como usar e praticar. Lembre-se, cada commit que você faz representa mais um capítulo da história do software que você está contando. 

Seja gentil com seus colegas e tente explicar o código que você está desenvolvendo em suas mensagens de commit. Eles o agradecerão mais tarde quando tentarem entender algo que você programou.

Vejo você no próximo post. Até mais!

[git_basics_post]: /git-basics-an-in-depth-look-at-essential-commands/#git-commit
[git_commit_post]:  https://cbea.ms/git-commit/
