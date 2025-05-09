+++
title = "Git Básico: Uma Análise Profunda nos Comandos Essenciais"
date = 2024-01-19
categories = ["TODO"]
tags = ["git"]
social_image: "git-basics-an-in-depth-look-at-essential-commands.pt.webp"
+++

<p class="intro"><span class="dropcap">Q</span>uando comecei a usar o Git, não existia nenhuma ferramenta GUI para gerenciar um repositório. Tudo tinha que ser feito via linha de comando. Após alguns anos, algumas boas ferramentas foram introduzidas, tornando o ciclo de vida do desenvolvedor mais produtivo com algumas GUIs do Git e ferramentas Git integradas a IDEs. Nesta série de posts, não falarei sobre GUIs do Git. Vou falar sobre o Git na linha de comando, e começaremos agora.</p>

### git config
A primeira coisa que precisamos fazer antes de usar o Git é configurar nossa identidade. Nossa identidade contém nosso nome e e-mail. Isso é importante para definir a autoria do commit. Para fazer isso globalmente em sua máquina, digite o seguinte:

{%- highlight sh -%}
git config --global user.name "Seu Nome"
{%- endhighlight -%}

{%- highlight sh -%}
git config --global user.email "seu@email.com"
{%- endhighlight -%}

Você pode verificar qual valor está configurado removendo o último parâmetro.

{%- highlight bash -%}
git config --global user.name
Seu Nome
{%- endhighlight -%}

{%- highlight bash -%}
git config --global user.email
seu@email.com
{%- endhighlight -%}

Essa configuração global é armazenada no arquivo .gitconfig no diretório home da sua máquina. Você pode verificar todas as configurações do Git desta maneira:

{%- highlight bash -%}
cat ~/.gitconfig
{%- endhighlight -%}

Além disso, se precisar especificar uma identidade diferente para um repositório específico em sua máquina, remova o parâmetro --global e execute o comando dentro do seu repositório.

{%- highlight bash -%}
git config user.email "outro@email.com"
{%- endhighlight -%}

Quando você faz isso, essa configuração é armazenada no arquivo de configuração dentro do diretório .git do projeto, e você pode ver o que existe dentro dele.

{%- highlight bash -%}
cat DIRETORIO_DO_SEU_PROJETO/.git/config
{%- endhighlight -%}

Com isso, estamos prontos para continuar a usar o Git. Mas vou mostrar outra configuração. Você pode escolher o editor que deseja usar quando o Git solicitar uma mensagem de commit ou quando ele precisar da sua ajuda para realizar alguma operação. Você pode escolher o editor preferido para interagir quando o Git solicitar algo a você. O editor vim será escolhido por padrão em máquinas Unix se nada estiver configurado, mas você pode escolher o nano se preferir.

{%- highlight bash -%}
git config --global core.editor "nano"
{%- endhighlight -%}

Estou acostumado com o vim. Não gosto do nano. Mas, para quem está usando a linha de comando pela primeira vez, pode ser melhor usar um editor de código para isso, como o VS Code.

{%- highlight bash -%}
git config --global core.editor "code --wait"
{%- endhighlight -%}

Você pode verificar como configurar outros editores, como Sublime e TextMate, lendo [esta documentação][core_editor_docs].

Após isso, você está preparado para criar seu primeiro repositório.

### git init
Quando criamos um novo projeto usando uma IDE, geralmente o repositório Git é criado automaticamente. Mas, se não estivermos usando um editor de código robusto ou simplesmente criando um novo projeto do zero, podemos digitar o seguinte para criar uma nova pasta e um repositório dentro dela:

{%- highlight bash -%}
git init NOME_DO_SEU_PROJETO
{%- endhighlight -%}

Com este simples comando, uma pasta com o nome do seu projeto será criada onde você está na linha de comando, e o repositório será iniciado. Você verá uma pasta oculta chamada .git dentro do seu projeto. No macOS, você pode pressionar o atalho CMD + SHIFT + . para vê-lo, pois é uma pasta oculta. Mas atenção: não mexa nesta pasta, pois você pode danificar seu repositório.

Se você já tiver uma pasta ou um projeto inteiro em um diretório específico e quiser criar um repositório, faça o mesmo mas omitindo o nome do projeto.

{%- highlight bash -%}
git init
{%- endhighlight -%}

Agora estamos prontos para o próximo passo: Adicionar alguns arquivos ao repositório.

### git add
Ao atualizar um projeto e precisar versioná-lo, devemos adicionar essas alterações ao repositório. O primeiro passo é incluir os arquivos modificados usando o seguinte comando:

{%- highlight bash -%}
git add .
{%- endhighlight -%}

Este comando adicionará todas as suas alterações. Se preferir, você pode especificar o nome de um arquivo ou diretório específico para adicionar. Isso é útil quando você deseja dividir seus commits.

{%- highlight bash -%}
git add NOME_DO_SEU_ARQUIVO.txt
{%- endhighlight -%}

{%- highlight bash -%}
git add NOME_DO_SEU_DIRETORIO
{%- endhighlight -%}

Você pode especificar mais de um arquivo ou diretório de uma vez. Basta adicionar um espaço e o nome que deseja.

{%- highlight bash -%}
git add PRIMEIRO_ARQUIVO.txt SEGUNDO_ARQUIVO.txt
{%- endhighlight -%}

Além disso, você pode adicionar arquivos usando Fileglobs para filtrar seus arquivos por extensão, por exemplo. Suponha que você altere arquivos Swift e arquivos de texto e queira adicionar apenas os arquivos Swift no commit:

{%- highlight bash -%}
git add *.swift
{%- endhighlight -%}

Compartilharei mais dicas sobre este comando, mas não agora. Este comando adiciona os arquivos ao stage mas ainda não comitamos. Vamos aprender isso agora.

### git commit
Agora é a hora de incorporar nossas alterações à história do repositório.

{%- highlight bash -%}
git commit
{%- endhighlight -%}

Se você seguir esta abordagem, o Git pedirá a mensagem do commit. Eu recomendo incorporar a mensagem do commit através de um parâmetro para evitar qualquer prompt do Git.

{%- highlight bash -%}
git commit -m "Título do seu commit"
{%- endhighlight -%}

A mensagem do commit pode ser dividida em duas partes: título e descrição. No exemplo acima, especificamos apenas o título da mensagem. Seguindo boas práticas, precisamos ser muito concisos no título. Se precisarmos adicionar uma explicação, podemos quebrar a linha duas vezes e escrever uma descrição longa com detalhes. Note que a aspa não está no final do título. Ela está localizada no final da descrição.

{%- highlight bash -%}
git commit -m "Título do seu commit

Esta é a descrição do commit.
Um lugar onde você pode explicar alguns aspectos da mudança em detalhes."
{%- endhighlight -%}

Para as melhores práticas de mensagens de commit, sugiro que você leia [este post][git_commit_post]. Foi escrito em 2014, mas ainda é muito relevante.

### git status
Digite o comando status para ver o que está acontecendo no seu diretório de trabalho.

{%- highlight bash -%}
git status

Na branch main
nothing to commit, working tree clean
{%- endhighlight -%}

Abaixo do comando, o Git me diz que estou em uma branch chamada `main` e que não há nada para fazer commit. Se eu mudar algum arquivo que já existe no repositório, o resultado será o seguinte:

{%- highlight bash -%}
git status

Na branch main
Changes not staged for commit:
(use "git add <file>..." to update what will be committed)
(use "git restore <file>..." to discard changes in working directory)
modified: arquivo.txt

no changes added to commit (use "git add" and/or "git commit -a")
{%- endhighlight -%}

Não podemos ver aqui, mas o Git nos mostra em vermelho os arquivos que não estão em stage. Se adicionarmos o arquivo ao stage usando `git add` e executarmos novamente `git status`, o arquivo aparecerá na cor verde.

Se adicionarmos algum novo arquivo ao repositório, o Git nos dirá que o arquivo não está sendo rastreado por ele, e você pode mudar isso usando `git add`.

{%- highlight bash -%}
git status

Na branch main
Untracked files:
(use "git add <file>..." to include in what will be committed)
novo_arquivo.txt

nothing added to commit but untracked files present (use "git add" to track)
{%- endhighlight -%}

E agora, o que vem a seguir? Vamos ver o log dos commits.

### git log
Cada commit no repositório pode ser visualizado usando o comando log. Você pode verificar quem o fez, quando e o que ele faz com base na mensagem do commit. Além disso, você pode usar o hash do commit para ver a alteração completa, mas não veremos isso neste post básico.

{%- highlight bash -%}
git log

commit 10d777cb334d99171e0c958925cb0caa615734ac (HEAD -> main, origin/main)
Author: Paulo Ricardo <paulo@ricardo.dev>
Date:   Sun Jan 14 18:17:22 2024 -0000

    Alterar o título da página

commit 8934fac280ff394926df4746d31da52f431d52bf
Author: Paulo Ricardo <paulo@ricardo.dev>
Date:   Sun Jan 14 18:14:34 2024 -0000

    Ajustar erro de ortografia

commit e9bfd726289f8a23049655cbee49315c36669706
Author: Laura Souza <laura@souza.dev>
Date:   Sun Jan 14 17:16:03 2024 -0000

    Revert "Adicionar logo da empresa"
    
    This reverts commit 85b52630af1655282b85dc7f56d9962503eb70ad.
{%- endhighlight -%}

Se o seu repositório tiver muitos commits, eles serão paginados com base na altura do seu terminal. Para navegar e ver mais commits, basta pressionar a barra de espaço.

### A jornada continua
Acredito que esses são os primeiros comandos que você precisará ao usar o Git pela primeira vez, e você os usará com frequência. Mas este não é o fim! Fique ligado porque em breve publicarei mais posts sobre Git, abordando mais comandos.

Compartilhe sua opinião sobre esta postagem nos comentários. Existe outro comando essencial do Git que você acredita que deveria ser incluído?

Até breve!

[core_editor_docs]: https://docs.github.com/pt/get-started/getting-started-with-git/associating-text-editors-with-git?platform=mac
[git_commit_post]:  https://cbea.ms/git-commit/