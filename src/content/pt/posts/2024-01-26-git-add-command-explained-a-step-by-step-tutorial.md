+++
title = "Comando Git Add Explorado: Um Tutorial Passo a Passo"
date = 2024-01-26
type = "post"
slug = "git-add-command-explained-a-step-by-step-tutorial"
aliases = ["/git-add-command-explained-a-step-by-step-tutorial"]
translationKey = "git-add-command-explained-a-step-by-step-tutorial"
categories = ["TODO"]
tags = ["git"]
image = "/img/cards/git-add-command-explained-a-step-by-step-tutorial.pt.webp"
+++

Para adicionar arquivos a um repositório Git, é necessário incluí-los em uma área específica para commit. Mas por que esse passo é necessário? Se eu fizer alterações, não quero adicioná-las ao repositório? Sim, de fato, mas vou mostrar a você alguns benefícios dessa abordagem e explicar mais detalhes sobre o comando. Vamos começar!

### Compreendendo a área de preparação (staging)
Em um repositório Git, a área de preparação é a etapa intermediária crucial entre modificar seus arquivos e salvar permanentemente essas alterações em um commit. A preparação permite que você escolha cuidadosamente quais modificações deseja incluir em seu próximo commit, oferecendo controle granular sobre o desenvolvimento do seu projeto e ajudando a articular seu processo de pensamento de maneira mais eficaz por meio dos commits.

Quando você faz alterações nos arquivos do seu projeto, o Git reconhece essas modificações, mas elas não são incluídas automaticamente no próximo commit. É aqui que entra o conceito de preparação. A área de preparação é um espaço de armazenamento temporário onde você escolhe seletivamente quais alterações devem fazer parte do próximo commit.

Ao preparar modificações específicas intencionalmente, você pode agrupar alterações relacionadas ou fazer commit separadamente. Isso promove um histórico de versão limpo e organizado, facilitando uma compreensão mais clara da progressão do seu projeto ou funcionalidade ao longo do tempo.

Agora que você conhece a área de preparação, vamos falar sobre como adicionar seus arquivos à ela.

### Adicionando arquivos à área de preparação
Como demonstrado no [último post][git_add_last_post], podemos adicionar arquivos à área de preparação usando vários métodos. No entanto, todas essas opções que vimos adicionam o arquivo inteiro à área de preparação. Abaixo, vou aprofundar mais, ajudando você a se tornar proficiente nisso.

Estou utilizando [este repositório][book_tracking_repo] para os exemplos, implementando alterações para mostrar como os comandos funcionam.

### Preparação parcial
Quando usamos o comando `git add` com o parâmetro `-p`, podemos revisar todas as alterações introduzidas e escolher quais adicionar à área de preparação.

Por que é importante pensar sobre isso? Tecnicamente, agrupar todas as alterações em um commit não apresenta problemas. No entanto, se você aprecia um histórico de commit organizado e deseja articular seu processo de pensamento, invista tempo na estruturação de suas alterações. Eu prefiro essa abordagem porque progredir em pequenos incrementos me permite reverter commits específicos posteriormente sem impactar toda a implementação. Quando estamos desenvolvendo um software, é comum mudarmos nosso pensamento e termos outra ideia baseada no que estamos descobrindo, e desta forma, você pode mudar sua implementação de forma estruturada e organizada.

Suponha que eu precise alterar o nome de uma fonte em um arquivo específico do projeto. Enquanto faço isso, encontro alguns comentários dentro do arquivo que decido remover. Agora, o que devo escrever no título do commit? "Alterar estilo da fonte e remover comentários desnecessários"? Errado. Combinar todas essas alterações em um commit pode levar à confusão, pois pode obscurecer a distinção entre as mudanças primárias e secundárias. Vamos explorar como podemos separar essas alterações em dois commits distintos.

```bash
git add -p
```

Quando você faz isso, o Git mostrará cada alteração separadamente em trechos:

```diff
diff --git a/BookTracking/AppDelegate.swift b/BookTracking/AppDelegate.swift
index 920883f..f174577 100644
--- a/BookTracking/AppDelegate.swift
+++ b/BookTracking/AppDelegate.swift
@@ -18,7 +18,7 @@ class AppDelegate: UIResponder, UIApplicationDelegate {
     }
     
     private func configAppearance() {
-        let fontName = "Georgia-Bold"
+        let fontName = "Georgia"
         
         UILabel.appearance().font = UIFont(name: fontName, size: 12)
         
(1/2) Stage this hunk [y,n,q,a,d,j,J,g,/,e,?]? 
```

O Git está nos informando que encontrou dois trechos, e este é o primeiro. Eu apenas mudei o nome da fonte "Geordia-Bold" para "Geordia". Este é o primeiro commit que quero fazer. Mas como faço isso? Observe que na última linha existem muitas opções (y,n,q,a,d,j,J,g,/,e,?). Cada uma delas é responsável por realizar alguma ação. Escolhi a última para ver a ajuda do Git com esses comandos. Basta digitar `?`:

```diff
(1/2) Stage this hunk [y,n,q,a,d,j,J,g,/,e,?]? ?
y - stage this hunk
n - do not stage this hunk
q - quit; do not stage this hunk or any of the remaining ones
a - stage this hunk and all later hunks in the file
d - do not stage this hunk or any of the later hunks in the file
j - leave this hunk undecided, see next undecided hunk
J - leave this hunk undecided, see next hunk
g - select a hunk to go to
/ - search for a hunk matching the given regex
e - manually edit the current hunk
? - print help
@@ -18,7 +18,7 @@ class AppDelegate: UIResponder, UIApplicationDelegate {
     }
     
     private func configAppearance() {
-        let fontName = "Georgia-Bold"
+        let fontName = "Georgia"
         
         UILabel.appearance().font = UIFont(name: fontName, size: 12)
         
(1/2) Stage this hunk [y,n,q,a,d,j,J,g,/,e,?]?
```

Agora podemos ver o que cada opção faz:

- y: Adiciona este trecho à área de preparação. Semelhante a `git add`, mas apenas para este trecho de código;
- n: Descarta este trecho da área de preparação. Este trecho de código não será adicionado, mas você não o perderá;
- q: Sai da seleção de alterações;
- a: Adiciona este trecho à área de preparação e todos os trechos subsequentes no arquivo. Isso é um pouco perigoso se você não souber ou lembrar o que existe nos trechos seguintes;
- d: Descarta este e os trechos seguintes neste arquivo;
- j: Deixa este trecho indefinido se você tiver alguma dúvida e passa para o próximo trecho indefinido;
- J: Deixa este trecho indefinido se você tiver alguma dúvida e passa para o próximo trecho;
- g: Esta é uma opção interessante: você pode navegar entre os trechos deste arquivo. Isso pode ser bom para você verificar algumas partes do código antes de adicionar ou descartar algo;
- /: Opção semelhante à função acima, mas você pode especificar alguma expressão regular para encontrar um trecho específico;
- e: Isso é incrível porque, se o seu trecho alterar muitas linhas, você pode selecionar quais linhas fazem sentido adicionar;
- ?: Esta foi a opção que usei para ver a ajuda.

Há muitas opções. O que preciso fazer? Neste caso, estou focando na alteração do nome da fonte. Então vou aceitar este trecho apenas digitando `y`. Agora, o Git nos mostra o segundo trecho. Este é o trecho de código que removi dos comentários. Vou deixar isso para outro commit. Vou descartá-lo digitando `n`.

```diff
(1/2) Stage this hunk [y,n,q,a,d,j,J,g,/,e,?]? y
@@ -34,15 +34,10 @@ class AppDelegate: UIResponder, UIApplicationDelegate {
     // MARK: UISceneSession Lifecycle
 
     func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
-        // Called when a new scene session is being created.
-        // Use this method to select a configuration to create the new scene with.
         return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
     }
 
     func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
-        // Called when the user discards a scene session.
-        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
-        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
     }
 
 
(2/2) Stage this hunk [y,n,q,a,d,K,g,/,s,e,?]? n
```

Agora terminamos! Vamos verificar o status do repositório para ver o que está acontecendo:

```bash
git status

On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   BookTracking/AppDelegate.swift

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   BookTracking/AppDelegate.swift
```

Observe que o arquivo `AppDelegate.swift` está localizado tanto na área de preparação quanto fora da área de preparação. Isso é possível porque selecionamos apenas um trecho do arquivo para realizar o commit.

Eu sei. Posso ouvir você agora me dizendo que é mais fácil fazer isso usando uma ferramenta de Git GUI. Ok, você está certo, mas é isso que a ferramenta de Git GUI fará nos bastidores. Mas se você preferir ou tiver apenas a linha de comando, saberá como adicionar arquivos à área de preparação. Isso foi uma pequena amostra de como usar esta opção. Existem mais possibilidades, e eu o encorajo a explorá-las.

Vamos explorar uma abordagem alternativa, utilizando um comando mais robusto.

### Preparação usando o modo interativo
O modo interativo é mais poderoso porque fornece um controle mais granular sobre a preparação. Adicionei um novo arquivo ao projeto, e agora vou mostrar o `git status`.

```bash
git status

On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   BookTracking.xcodeproj/project.pbxproj
	modified:   BookTracking/AppDelegate.swift

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	BookTracking/Components/IconViewComponent.swift

no changes added to commit (use "git add" and/or "git commit -a")
```

Observe o arquivo não rastreado no final da mensagem do Git. Se eu executar `git add -p`, este arquivo não será mostrado. Mas usando o modo interativo, teremos a possibilidade de trabalhar com ele. Isso ocorre porque `git add -p` só funciona analisando as alterações nos arquivos do repositório, não em novos arquivos ainda não adicionados. No entanto, usar o modo interativo não é um problema porque nos permite adicionar este arquivo ao repositório.

```diff
git add -i

           staged     unstaged path
  1:    unchanged        +4/-0 BookTracking.xcodeproj/project.pbxproj
  2:    unchanged        +1/-6 BookTracking/AppDelegate.swift

*** Commands ***
  1: status	  2: update	  3: revert	  4: add untracked
  5: patch	  6: diff	  7: quit	  8: help
What now> 

```

No início da mensagem, o "status" é visível. Abaixo, você encontrará comandos disponíveis, cada um associado a um número. Você pode então executar o comando desejado digitando seu número no diálogo "What now" na parte inferior. Agora, vamos aprofundar nas opções:

- 1: Mostra os caminhos dos arquivos com alterações;
- 2: Adiciona as alterações à área de preparação;
- 3: Reverte as alterações para voltar à área não preparada;
- 4: Adiciona os arquivos não rastreados à área de preparação. Observe que não podemos ver esses arquivos no status;
- 5: Escolha trechos e adicione-os seletivamente. É o mesmo que `git add -p`;
- 6: Mostra a diferença das alterações na área de preparação;
- 7: Sai do modo interativo;
- 8: Mostra o menu de ajuda.

O status (opção 1) é o que estamos vendo agora. Vamos explorar a opção 2 para adicionar as alterações à área de preparação. Em "What now" eu digitei 2.

```diff
What now> 2
           staged     unstaged path
  1:    unchanged        +4/-0 BookTracking.xcodeproj/project.pbxproj
  2:    unchanged        +1/-6 BookTracking/AppDelegate.swift
Update>> 
```

Agora o Git mostra dois arquivos que eu alterei e pergunta qual deles eu quero fazer a ação. Observe que os arquivos são enumerados, e precisamos usar isso para informar no diálogo "Update". Vou escolher o arquivo `AppDelegate.swift`, enumerado como o número 2.

```diff
Update>> 2   
           staged     unstaged path
  1:    unchanged        +4/-0 BookTracking.xcodeproj/project.pbxproj
* 2:    unchanged        +1/-6 BookTracking/AppDelegate.swift
Update>> 
```

O Git exibe o mesmo conteúdo e repete a pergunta, mas observe que o arquivo selecionado tem um asterisco. Você pode adicionar mais arquivos, mas por enquanto, vou apenas pressionar "enter" para concluir o processo.

```diff
Update>> 
updated 1 path

*** Commands ***
  1: status	  2: update	  3: revert	  4: add untracked
  5: patch	  6: diff	  7: quit	  8: help
What now> 
```

O Git nos informou que atualizou um caminho e forneceu os comandos mais uma vez. Verificar o status atual revelará alterações na tabela.

```diff
What now> 1
           staged     unstaged path
  1:    unchanged        +4/-0 BookTracking.xcodeproj/project.pbxproj
  2:        +1/-6      nothing BookTracking/AppDelegate.swift

*** Commands ***
  1: status	  2: update	  3: revert	  4: add untracked
  5: patch	  6: diff	  7: quit	  8: help
What now> 
```

Observe que na coluna "staged", o arquivo `AppDelegate.swift` contém a discriminação das alterações: uma linha adicionada ou alterada e seis removidas. Você pode ver o que está na área de preparação usando a opção 6 (diff).

```diff
What now> 6
           staged     unstaged path
  1:        +1/-6      nothing BookTracking/AppDelegate.swift
Review diff>>
```

Novamente, o Git nos mostrará os arquivos preparados, e precisamos escolher um deles para ver a diferença. Vamos escolher o arquivo número 1 no diálogo "Review diff".

```diff
Review diff>> 1
diff --git a/BookTracking/AppDelegate.swift b/BookTracking/AppDelegate.swift
index 920883f..f174577 100644
--- a/BookTracking/AppDelegate.swift
+++ b/BookTracking/AppDelegate.swift
@@ -18,7 +18,7 @@ class AppDelegate: UIResponder, UIApplicationDelegate {
     }
     
     private func configAppearance() {
-        let fontName = "Georgia-Bold"
+        let fontName = "Georgia"
         
         UILabel.appearance().font = UIFont(name: fontName, size: 12)
         
@@ -34,15 +34,10 @@ class AppDelegate: UIResponder, UIApplicationDelegate {
     // MARK: UISceneSession Lifecycle
 
     func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
-        // Called when a new scene session is being created.
-        // Use this method to select a configuration to create the new scene with.
         return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
     }
 
     func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
-        // Called when the user discards a scene session.
-        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
-        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
     }
 
 

*** Commands ***
  1: status	  2: update	  3: revert	  4: add untracked
  5: patch	  6: diff	  7: quit	  8: help
What now> 
```

O Git nos mostra todas as alterações que estão na área de preparação. Vamos explorar outra opção. Se você quiser descartar essas alterações para a área de preparação, pode usar a ação de reverter, que é a opção 3.

```diff
What now> 3
           staged     unstaged path
  1:        +1/-6      nothing BookTracking/AppDelegate.swift
Revert>> 
```

Novamente, o Git nos perguntará quais arquivos queremos reverter. Vou selecionar o arquivo número 1 para continuar.

```diff
Revert>> 1
           staged     unstaged path
* 1:        +1/-6      nothing BookTracking/AppDelegate.swift
Revert>> 
```

Verifique se o arquivo que você escolheu contém o asterisco, e se não houver outro arquivo para reverter, basta pressionar "enter".

```diff
Revert>> 
reverted 1 path

*** Commands ***
  1: status	  2: update	  3: revert	  4: add untracked
  5: patch	  6: diff	  7: quit	  8: help
What now> 
```

O Git nos disse que reverteu um arquivo. Vamos verificar o status para ver o que está acontecendo.

```diff
What now> 1
           staged     unstaged path
  1:    unchanged        +4/-0 BookTracking.xcodeproj/project.pbxproj
  2:    unchanged        +1/-6 BookTracking/AppDelegate.swift

*** Commands ***
  1: status	  2: update	  3: revert	  4: add untracked
  5: patch	  6: diff	  7: quit	  8: help
What now> 
```

Agora tudo está como era antes!

Eu falei sobre arquivos não rastreados, certo? Vamos explorar a opção 4 para vê-la em ação.

```diff
What now> 4
           staged     unstaged path
  1: BookTracking/Components/IconViewComponent.swift
Add untracked>> 
```

O modo interativo exibe os arquivos não rastreados. Eu tenho apenas um novo arquivo neste projeto, mas seu projeto pode ter vários arquivos. Escolha os arquivos que você deseja adicionar à área de preparação. No meu caso, é o arquivo 1.

```diff
Add untracked>> 1   
           staged     unstaged path
* 1: BookTracking/Components/IconViewComponent.swift
Add untracked>> 
```

Verifique se seus arquivos foram selecionados corretamente e pressione "enter".

```diff
Add untracked>> 
added 1 path

*** Commands ***
  1: status	  2: update	  3: revert	  4: add untracked
  5: patch	  6: diff	  7: quit	  8: help
What now> 
```

O Git nos disse que um arquivo foi adicionado. Vamos verificar o status para ver o que está acontecendo.

```diff
What now> 1
           staged     unstaged path
  1:    unchanged        +4/-0 BookTracking.xcodeproj/project.pbxproj
  2:    unchanged        +1/-6 BookTracking/AppDelegate.swift
  3:       +12/-0      nothing BookTracking/Components/IconViewComponent.swift

*** Commands ***
  1: status	  2: update	  3: revert	  4: add untracked
  5: patch	  6: diff	  7: quit	  8: help
What now> 
```

Agora temos o novo arquivo na área de preparação. Funciona!

Vamos explorar mais uma opção: O patch. Esta é a opção 5 e é o mesmo que `git add -p`. Vamos ver:

```diff
What now> 5
           staged     unstaged path
  1:    unchanged        +4/-0 BookTracking.xcodeproj/project.pbxproj
  2:    unchanged        +1/-6 BookTracking/AppDelegate.swift
Patch update>> 
```

Primeiro, selecione seus arquivos para aplicar o patch. Vou escolher o arquivo 2.

```diff
Patch update>> 2
           staged     unstaged path
  1:    unchanged        +4/-0 BookTracking.xcodeproj/project.pbxproj
* 2:    unchanged        +1/-6 BookTracking/AppDelegate.swift
Patch update>> 
```

Verifique se o arquivo foi selecionado e pressione "enter" para confirmar.

```diff
Patch update>>     
diff --git a/BookTracking/AppDelegate.swift b/BookTracking/AppDelegate.swift
index 920883f..f174577 100644
--- a/BookTracking/AppDelegate.swift
+++ b/BookTracking/AppDelegate.swift
@@ -18,7 +18,7 @@ class AppDelegate: UIResponder, UIApplicationDelegate {
     }
     
     private func configAppearance() {
-        let fontName = "Georgia-Bold"
+        let fontName = "Georgia"
         
         UILabel.appearance().font = UIFont(name: fontName, size: 12)
         
(1/2) Stage this hunk [y,n,q,a,d,j,J,g,/,e,?]? 
```

Agora, observe o mesmo processo da seção anterior deste post. Nada muda. Aceite ou negue os trechos conforme necessidade. No final, você será redirecionado para os comandos do modo interativo.

Nesses comandos, com a opção 7 você pode sair do modo interativo, e com a opção 8 você pode ver algumas instruções básicas para cada comando. Acabamos aqui! Depois disso, você pode sair do modo interativo, commitar suas alterações e ser feliz.

Usando o modo interativo, podemos reverter alguns arquivos da área de preparação. Mas podemos fazer isso de uma forma mais simples. Vamos aprender.

## Removendo arquivos da área de preparação

Assim como posso adicionar arquivos à area de preparação, também posso removê-los. Se você digitar `git status`, poderá ver a dica do Git sobre como fazer isso. Vamos conferir.

```diff
git status      

On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   BookTracking/AppDelegate.swift
	new file:   BookTracking/Components/IconViewComponent.swift

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   BookTracking.xcodeproj/project.pbxproj
	modified:   BookTracking/AppDelegate.swift
```

Veja as dicas do Git acima dos nomes dos arquivos. Vamos remover da área de preparação as alterações no arquivo `AppDelegate.swift`.

```diff
git restore --staged BookTracking/AppDelegate.swift
```

O Git não mostra nada para nós. Vamos verificar o status para ver o que está acontecendo.

```diff
git status                                         
On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	new file:   BookTracking/Components/IconViewComponent.swift

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   BookTracking.xcodeproj/project.pbxproj
	modified:   BookTracking/AppDelegate.swift
```

Agora podemos ver que o arquivo `AppDelegate.swift` voltou para os arquivos não confirmados. Ótimo! Mas o que acontece se usarmos o mesmo comando sem o parâmetro `--staged`? Vamos ver.

```diff
git restore BookTracking/AppDelegate.swift
```

E então o status:

```diff
git status                                
On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	new file:   BookTracking/Components/IconViewComponent.swift

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   BookTracking.xcodeproj/project.pbxproj
```

Oh não! Perdi minhas alterações! Sem o parâmetro `--staged`, o Git descartará as alterações na área não preparada e será impossível recuperar qualquer coisa. Tenha cuidado com esses comandos para não perder seu trabalho árduo.

## Usando a área de preparação no dia a dia
Ao mergulhar no mundo do Git, é comum adicionar todas as alterações à area de preparação e fazer apenas um commit. No entanto, à medida que sua experiência cresce, a importância da etapa de preparação torna-se cada vez mais evidente.

O uso estratégico do comando `git add` permite que você faça a transição do hábito inicial de preparar tudo para uma abordagem mais refinada. Cuidar do que será inserido em cada commit leva a um histórico de versão que conta uma história clara e lógica da evolução do seu projeto. Commits pequenos e focados não são apenas uma prática, mas uma estratégia para manter um histórico organizado e compreensível.

Considere a natureza colaborativa de muitos projetos de desenvolvimento. Ao preparar as alterações cuidadosamente, você contribui para um processo de desenvolvimento mais colaborativo e eficiente. Cada commit se torna uma contribuição significativa, facilitando para os membros da equipe compreender, revisar, e integrar alterações de forma transparente.

Dividir suas alterações em commits menores e bem definidos facilita a depuração mais eficiente. Se surgir um problema, você pode identificar exatamente o commit responsável, tornando mais simples identificar e corrigir problemas sem vasculhar um commit monolítico que abrange várias alterações.

Encontrar o equilíbrio certo entre commits coesos e mudanças granulares é uma arte que evolui com a experiência. Cada commit deve encapsular uma unidade lógica de trabalho, fornecendo uma visão do progresso sem sobrecarregar o histórico de commits.

Eu aprendi a apreciar isso e fazer inúmeras pequenas alterações, cada uma encapsulando uma mudança específica. Essa prática não apenas está alinhada com as melhores práticas de controle de versão, mas também aprimora a agilidade geral do seu processo de desenvolvimento.

Ao embarcar em sua jornada com o Git, deixe a área de preparação ser sua aliada na criação de um histórico de versão que não é apenas um registro de alterações, mas uma narrativa do crescimento e refinamento do seu projeto. Dê uma chance a esta forma de pensar e observe como ela transforma seu fluxo de trabalho de controle de versão em uma colaboração eficiente e sem problemas.

É isso! Você usa este comando? Já conhecia essas possibilidades ou como este comando pode ajudá-lo? Compartilhe seus pensamentos sobre esta postagem nos comentários.

Até breve!

[git_add_last_post]: /git-basics-an-in-depth-look-at-essential-commands/#git-add
[book_tracking_repo]: https://github.com/ionixjunior/BookTracking