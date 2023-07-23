---
layout: post
title:  "Aplicativo com mapa offline usando Ionic Framework"
date:   2016-01-18
translations: ["en"]
redirect_from:
    - /aplicativo-com-mapa-offline-usando-ionic-framework
---

<p class="intro"><span class="dropcap">V</span>amos lá, esse post foi inspirado em uma dúvida postada no Slack do Ionic Brazil. A pergunta foi mais ou menos assim: “Alguém já fez algo relacionado a mapas, como baixar o mapa pro celular do cara, sem precisar ficar carregando o mapa online?”</p>

Tendo em vista que isso também pode ser dúvida de outros desenvolvedores, aqui vai um breve post que tem como objetivo deixar as coisas um pouco mais claras em relação ao assunto.

O projeto exemplo pode ser baixado no [Github][projeto].

Neste projeto exemplo, foi utilizado o template maps do wizard do Ionic Framework. Então, a partir de agora vejamos as alterações que realizei no projeto.

### Alterando mapa para utilizar engine Leaflet

No projeto existe uma diretiva personalizada chamada map, existente no arquivo directives.js. O que vamos fazer é customizá-la para carregar os mapas utilizando [Leaflet][leaflet] ao invés do Google Maps.

Então, vamos adicionar o Leaflet nas dependências do projeto. Poderíamos simplesmente utilizar bower install leaflet –save-dev mas isso iria trazer algumas dependências desnecessárias do AngularJS, pois o Ionic Framework já incorpora todas elas, então, vamos adicionar o Leaflet manualmente no projeto. Na página de [download do Leaflet][leaflet-download] você encontra o pacote para baixar. Neste projeto de exemplo, utilizei a última versão estável, 0.7.7.

Após baixar, você pode mover o conteúdo para a pasta www/lib do projeto e em seguida referenciar os arquivos javascript e CSS da biblioteca no arquivo index.html do aplicativo.

Neste projeto, o elemento que está renderizando o mapa é a diretiva map, localizada no arquivo index.html. O que precisamos fazer é alterar a engine de criação do mapa para o Leaflet ao invés do Google Maps. Começamos alterando a diretiva no arquivo directives.js:

{%- highlight js -%}
link: function ($scope, $element, $attr) {
    function initialize() {
        var mapOptions = {
            center: [43.07493, -89.381388],
            zoom: 16
        };
        var map = L.map($element[0], mapOptions);
        L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);

        $scope.onCreate({map: map});
    }

    if (document.readyState === "complete") {
        initialize();
    } else {
        window.addEventListener('load', initialize);
    }
}
{%- endhighlight -%}

Mas apenas isso não basta, no controller MapCtrl também precisamos alterar o método que centraliza o mapa em uma determinada latitude e longitude, pois como trocamos a engine para o Leaflet, agora não iremos mais usar os objetos do Google Maps para interagir com o mapa. Alterei o arquivo controllers.js na linha destacada:

{%- highlight js -%}
$scope.centerOnMe = function () {
    console.log("Centering");
    if (!$scope.map) {
        return;
    }

    $scope.loading = $ionicLoading.show({
        content: 'Getting current location...',
        showBackdrop: false
    });

    navigator.geolocation.getCurrentPosition(function (pos) {
        console.log('Got pos', pos);
        $scope.map.setView([pos.coords.latitude, pos.coords.longitude]);
        $scope.loading.hide();
    }, function (error) {
        alert('Unable to get location: ' + error.message);
    });
};
{%- endhighlight -%}

Por fim, excluí a inserção da biblioteca do Google Maps, presente no arquivo www/index.html. Com isso, já temos o aplicativo funcionando com o mapa utilizando a engine do Leaflet.

### Baixando mapas utilizando MOBAC

[MOBAC, Mobile Atlas Creator][mobac] é um programa open source que cria atlas offline para dispositivos portáteis de GPS e aplicativos de telefone celular como TrekBuddy, AndNav e outras aplicações Android e Windows CE. Bom, isso é o que diz a descrição dele no site, mas como podemos tirar proveito disso?

Com MOBAC, conseguimos selecionar uma parte do mapa, baixar os map tiles, adiciona-los no nosso aplicativo e, por fim, fazer a engine do Leaflet carregar os map tiles contidos no aplicativo. Então, vamos baixa-lo para iniciar as operações. Atualmente o MOBAC está na versão 2.0.0 beta 1.

MOBAC é um aplicativo multiplataforma, desenvolvido em Java, então, você não deverá ter problemas para executa-lo em seu sistema operacional, sendo Windows, Linux, Mac, etc... ).

Ao abrir o MOBAC, vamos clicar no menu Atlas -> Convert Atlas Format e selecionar a opção Osmdroid ZIP.

Em seguida, na aba Map Source, selecione o OpenStreetMap MapQuest (1), então, iremos visualizar o mapa (2). Com o mapa aberto, é possível controlar o zoom do mesmo (3) para visualizar as regiões do globo.

<figure>
	<img src="/assets/img/mobac-tela1.jpg" alt="Tela do MOBAC."> 
	<figcaption>Tela do MOBAC.</figcaption>
</figure>

No exemplo ilustrado, selecionei uma área da cidade de São Paulo para fins demonstrativos. Para baixar uma área do mapa, basta utilizar o cursor para selecionar a área desejada. Você irá visualizar a área selecionada hachurada em vermelho (4). Após selecionar uma área, você deve informar na aba Zoom Levels quais os zooms que deseja baixar os map tiles (5). Observe que, quanto maior a área selecionada e maior o zoom, mais imagens serão baixadas. Após selecionar os zooms desejados, clique em Add selection (6), ainda na aba Zoom Levels.

<figure>
	<img src="/assets/img/mobac-tela2.jpg" alt="Tela do MOBAC."> 
	<figcaption>Tela do MOBAC.</figcaption>
</figure>

Após isso, basta baixar o mapa clicando em Atlas -> Create Atlas. Agora aguarde, mas fique atento caso existirem mensagens de erro. Talvez algumas imagens estejam indisponíveis para download devido a sobrecarga que este processo causa nos servidores.

Um detalhe muito importante aqui é que devemos utilizar isso com moderação, pois isso sobrecarrega os servidores de mapas e prejudica a utilização de outros usuários. Na página da wiki contém alguns [conselhos aos usuários][conselhos].

Bom, após baixar o mapa selecionado, podemos clicar em Open Atlas Folder e visualizar o nosso mapa recém baixado. Nosso mapa está disponível em formato ZIP. Ao descompactar, uma pasta MapQuest aparecerá e dentro dela outras pastas com as numerações dos zooms selecionados. Dentro da pasta de cada zoom haverão outras pastas com as coordenadas de do eixo X e dentro destas pastas, estarão as respectivas imagens em formato JPG com as coordenadas do eixo Y. O que fazer agora? Vamos adicionar a pasta MapQuest dentro do nosso aplicativo.

### Adicionando mapa baixado com MOBAC no aplicativo Ionic

Agora a parte mais esperada do tutorial. Vamos adicionar a pasta MapQuest extraída do arquivo ZIP para dentro de nosso aplicativo na pasta www.

O próximo passo é voltar na diretiva map e alterar o tile layer para não carregar da referência online, e sim da offline. Também vamos alterar a latitude e longitude inicial para carregamento do mapa, fazendo o ajuste para carregar de acordo com o lugar que baixamos o mapa:

{%- highlight js -%}
link: function ($scope, $element, $attr) {
    function initialize() {
        var mapOptions = {
            center: [-23.568746, -46.647132],
            zoom: 18
        };
        var map = L.map($element[0], mapOptions);
        L.tileLayer('MapQuest/{z}/{x}/{y}.jpg', {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);

        $scope.onCreate({map: map});
    }

    if (document.readyState === "complete") {
        initialize();
    } else {
        window.addEventListener('load', initialize);
    }
}
{%- endhighlight -%}

Perceba que configuramos uma URL relativa na configuração do tile layer para carregar os mapas. Essa referência relativa aponta para a pasta www. Como a pasta MapQuest já está em www, basta apenas referenciar a pasta e o Leaflet irá carregar as imagens corretamente a partir do endereço local. Note que, como modificamos o tile layer para carregar os mapas localmente, quaisquer outras partes do mapa que tentarmos consumir não poderão ser visualizadas.

Observação importante: o mapa que incluí no aplicativo possui aproximadamente 4 MB. Se você tentar incluir um mapa de uma cidade inteira ou de uma região muito grande, irá perceber que a compilação do aplicativo irá demorar. Isso se deve ao fato das imagens estarem incluídas na pasta www do aplicativo, então, em cada processo de compilação, os mapas incluídos nesta pasta serão processados.

Para evitar que isso aconteça, podemos utilizar de outras técnicas, como por exemplo, baixar o mapa com o aplicativo em execução e chavear a diretiva map para carregar online ou offline, o que acha? Isso poderá ser pauta para um novo artigo.

Por hoje é só. Deixe seu comentário, sendo ele crítica ou sugestão.

[projeto]:          https://github.com/ionixjunior/ionic-offline-maps
[leaflet]:          http://leafletjs.com/
[leaflet-download]: https://leafletjs.com/download.html
[mobac]:            http://mobac.sourceforge.net/
[conselhos]:        https://wiki.openstreetmap.org/wiki/Blocked_Tiles