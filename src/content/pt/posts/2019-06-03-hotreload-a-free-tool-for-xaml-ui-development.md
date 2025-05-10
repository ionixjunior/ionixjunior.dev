+++
title = "HotReload: uma ferramenta gratuita para desenvolvimento de UI em XAML"
date = 2019-06-03
type = "post"
slug = "hotreload-a-free-tool-for-xaml-ui-development"
aliases = ["/hotreload-a-free-tool-for-xaml-ui-development"]
translationKey = "hotreload-a-free-tool-for-xaml-ui-development"
categories = ["mobile"]
tags = ["xamarin"]
+++

Há um tempo escrevi um post chamado Xamarin.Forms e UI – Qual ferramenta é mais produtiva?. Neste post, criei um comparativo entre as principais ferramentas existentes naquele momento para facilitar o desenvolvimento de apps com Xamarin.Forms usando XAML. Agora surgiu uma nova ferramenta chamada HotReload. Vamos dar uma conferida nela e compará-la junto com as demais ferramentas?

Aqui está o [link do post][post-primeiro-comparativo] que comentei acima. 

Acho que uma das coisas mais fantásticas no **HotReload** é o fato dele ser **open source**! Sim, você pode conferir o [projeto no Github][hot-reload] e quem sabe até auxiliar o pessoal lá.

Não vou realizar uma introdução detalhada sobre o **HotReload**, pois o [Mahmoud Ali][akamud] já fez. [Aqui está o review][review-akamud] que ele fez da ferramenta. Então, você pode conferir isso por lá também. O foco aqui é o comparativo com as demais ferramentas que já havia avaliado no outro post. Bora lá!

### Custo
Essa ferramenta é gratuita! Sim, agora podemos contar com uma solução gratuita para o desenvolvimento de interfaces usando **XAML**.

### Suporte a custom renders, effects, componente de terceiros, native views, ContentViews, animações e design time data
Em todos esses estes quesitos o **HotReload** funcionou perfeitamente. Nenhum problema considerável encontrado nesses testes.

### Suporte a ResourceDictionary
A ferramenta dá suporte ao **ResourceDictionary**, mas com uma ressalva. Se a tela que estamos alterando possuir um **ResourceDictionary** e realizamos alterações nele, nenhum problema ocorre. Entretanto, caso realizarmos alterações no **ResourceDictionary** global da aplicação, essas alterações não são imediatamente propagadas para a tela, podendo até fazer com que o app trave. O exemplo que fiz foi bem simples, com o reload em ação, adicionei um novo estilo ao **ResourceDictionary** e tentei referenciá-lo na página. Daí a tela ficou em branco e nada mais funcionou. Mas calma, já tem até um [issue][issue-64] aberto para isso e logo deverá ser resolvido.

EXTRA EXTRA: Informo que o problema citado acima já foi resolvido! 🙂 No momento que eu estava escrevendo este artigo o problema existia, ele recém foi corrigido. A solução do problema chegou com a versão 1.3.0 da biblioteca, então, atualize o pacote NuGet.

### Suporte a múltiplos dispositivos simultaneamente
Sim, com o **HotReload** também temos suporte ao preview em múltiplos dispositivos simultaneamente. No entanto, algumas pequenas configurações devem ser realizadas para que tudo isso funcione conforme esperado. Novamente, o [Mahmoud Ali][akamud] já fez um post super detalhado explicando tudo isso e, inclusive, até criou um script para facilitar toda essa configuração.

**Update: 22/06/19**: Recentemente foi lançada uma atualização da extensão que faz a descoberta automática dos IPs dos devices. Fantástico! Isso significa menos configuração para iniciar nossos projetos 😉

### Notificações de erros
O **HotReload** mostra sim as notificações dos erros, mas você precisa estar com o app executando no emulador / simulador / device enquanto realiza as alterações no **XAML** 🙂 Eu não havia percebido isso pois estava testando-o sem executar o app nos devices, por isso não visualizava os erros quando eles aconteciam.

### Fatos interessantes
Durante os testes estava realizando alterações em uma página e tudo estava acontecendo conforme o esperado. Alterei a cor de fundo de uma tela e a cor mudou, no entanto, quando removi a cor, a mesma não foi restaurada para a padrão. Um tanto estranho, mas nada muito grave. É algo contornável e até pode ter relação com o problema citado acima no issue que referenciei. Em breve, isso deve ser superado e poderemos contar com uma ferramenta ainda melhor.

### Considerações e tabela comparativa
Finalmente a comunidade pode contar com uma solução boa e gratuita. Particularmente falando, ainda gosto muito do **LiveXAML** por ele ser mais prático (não necessita de quaisquer workarounds), mas estou testando o **HotReload** e confesso que estou muito impressionado com tudo e bastante motivado, pois por ser um projeto **open source**, a tendência é acontecer uma evolução muito rápida desta ferramenta.

Abaixo a tabela comparativa das ferramentas de **UI** (agora com o **HotReload** incluído):

| Características                            | HotReload       | LiveXAML        | Gorilla Player       | XAML Previewer     | Xamarin Live Player |
| ------------------------------------------ | --------------- | --------------- | -------------------- | ------------------ | ------------------- |
| Preço                                      | Gratuito        | $240 ou $24/mês | Gratuito             | Gratuito           | Gratuito            |
| Suporte à custom renderers                 | ✅              | ✅              | ✅ (com Gorilla SDK) | ⚠️ (somente no iOS) | ❌                  |
| Suporte à effects                          | ✅              | ✅              | ✅ (com Gorilla SDK) | ⚠️ (somente no iOS) | ❌                  |
| Suporte à componentes de terceiros         | ✅              | ✅              | ✅ (com Gorilla SDK) | ✅                 | -                   |
| Suporte à native views                     | ✅              | ✅              | ❌                   | ✅                 | -                   |
| Suporte à ContentViews                     | ✅              | ✅              | ✅                   | ✅                 | -                   |
| Suporte à ResourceDictionary               | ✅              | ✅              | ✅                   | ✅                 | -                   |
| Suporte à multiplos devices ao mesmo tempo | ✅              | ✅              | ✅                   | ❌                 | ❌                  |
| Notificação de erros                       | ✅              | ✅              | ✅                   | ✅                 | ✅                  |

Por hoje é isso. Valeu, galera. Um abraço!

[post-primeiro-comparativo]: /pt/xamarin-forms-and-ui-which-tool-is-more-productive
[hot-reload]:                https://github.com/AndreiMisiukevich/HotReload
[akamud]:                    https://github.com/akamud
[review-akamud]:             http://high5devs.com/2019/04/hotreload-desenvolvendo-telas-mais-rapido-para-xamarin-forms-de-maneira-gratuita/
[issue-64]:                  https://github.com/AndreiMisiukevich/HotReload/issues/64