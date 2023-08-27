---
layout: post
title: "Offline map app using Ionic Framework"
date: 2016-01-18
translations: ["pt"]
tags: ["ionic"]
---

<p class="intro"><span class="dropcap">L</span>et's go! This post was inspired by a question posted in the Ionic Brazil Slack. The question was something like: "Has anyone done anything related to maps, like downloading the map to the user's phone, without needing to load it online?"</p>

Considering that this might be a doubt for other developers as well, here's a brief post aimed to clarify things on this subject.

The example project can be downloaded from [GitHub][project].

In this sample project, the maps template from the Ionic Framework wizard was used. Now, let's see the changes I made to the project.

### Switching the Map to Use Leaflet Engine

In the project, there is a custom directive called `map`, located in the `directives.js` file. What we'll do is customize it to load the maps using [Leaflet][leaflet] instead of Google Maps.

First, we need to add Leaflet to the project dependencies. We could simply use `bower install leaflet --save-dev`, but that would bring some unnecessary AngularJS dependencies, as the Ionic Framework already includes all of them. So, let's add Leaflet manually to the project. You can download the package from the [Leaflet download page][leaflet-download]. In this example project, I used the latest stable version, 0.7.7.

After downloading, move the contents to the `www/lib` folder of the project, and then reference the JavaScript and CSS files of the library in the `index.html` file of the app.

In this project, the element rendering the map is the `map` directive, located in the `index.html` file. What we need to do is change the map creation engine to Leaflet instead of Google Maps. We'll start by modifying the directive in the `directives.js` file:

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

But that's not enough; in the `MapCtrl` controller, we also need to change the method that centers the map at a certain latitude and longitude. As we switched to the Leaflet engine, we won't use the Google Maps objects to interact with the map anymore. I modified the `controllers.js` file on the highlighted line:

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

Finally, I removed the insertion of the Google Maps library from the `www/index.html` file. With this, we have the app working with the map using the Leaflet engine.

### Downloading Maps using MOBAC

[MOBAC, Mobile Atlas Creator][mobac] is an open-source program that creates offline atlases for portable GPS devices and phone applications such as TrekBuddy, AndNav, and other Android and Windows CE applications. Well, that's what its website description says, but how can we take advantage of it?

With MOBAC, we can select a map area, download the map tiles, add them to our app, and then make the Leaflet engine load the map tiles from the app itself. So, let's download it to start the operations. Currently, MOBAC is in version 2.0.0 beta 1.

MOBAC is a multi-platform application, developed in Java, so you shouldn't have any problems running it on your operating system, be it Windows, Linux, Mac, etc...

When you open MOBAC, click on `Atlas` -> `Convert Atlas Format`, and select the `Osmdroid ZIP` option.

Next, in the `Map Source` tab, select `OpenStreetMap MapQuest` (1); then, you will see the map (2). You can control the zoom of the map (3) to visualize the globe's regions.

<figure>
	<img src="/assets/img/mobac-tela1.jpg" alt="MOBAC Screen."> 
	<figcaption>MOBAC Screen.</figcaption>
</figure>

In the illustrated example, I selected an area of São Paulo city for demonstrative purposes. To download a map area, simply use the cursor to select the desired area. You will see the selected area hashed in red (4). After selecting an area, you must inform in the `Zoom Levels` tab which zoom levels you want to download the map tiles (5). Note that the larger the selected area and the higher the zoom, the more images will be downloaded. After selecting the desired zooms, click `Add selection` (6) in the `Zoom Levels` tab.

<figure>
	<img src="/assets/img/mobac-tela2.jpg" alt="MOBAC Screen."> 
	<figcaption>MOBAC Screen.</figcaption>
</figure>

After that, simply download the map by clicking on `Atlas` -> `Create Atlas`. Now, wait, but be attentive in case there are error messages. Some images may be unavailable for download due to the overload that this process causes on the servers.

A very important detail here is that we should use this with moderation, as it overloads the map servers and hampers the use for other users. The wiki page contains some [advice for users][advice].

Well, after downloading the selected map, we can click on `Open Atlas Folder` and view our freshly downloaded map. Our map is available in ZIP format. After unpacking, a `MapQuest` folder will appear, and inside it, other folders with the selected zoom numbers. Within each zoom folder, there will be other folders with X-axis coordinates, and inside these folders will be the respective JPG images with the Y-axis coordinates. What to do now? Let's add the `MapQuest` folder to our app.

### Adding the Downloaded Map with MOBAC to the Ionic App

Now, the most awaited part of the tutorial. Let's add the `MapQuest` folder extracted from the ZIP file to the `www` folder of our app.

The next step is to go back to the `map` directive and change the tile layer not to load from the online reference, but from the offline reference. We'll also change the initial latitude and longitude for map loading, making adjustments to load according to the place where we downloaded the map:

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

Notice that we configured a relative URL in the tile layer's configuration to load the maps. This relative reference points to the `www` folder. As the `MapQuest` folder is already in `www`, we only need to reference the folder, and Leaflet will correctly load the images from the local address. Note that, as we modified the tile layer to load the maps locally, any other parts of the map that we try to consume will not be visible.

Important note: the map I included in the app is approximately 4 MB. If you try to include a map of an entire city or a very large region, you will notice that the app's compilation will take a while. This is because the images are included in the `www` folder of the app, so in each compilation process, the maps included in this folder will be processed.

To avoid this, we can use other techniques, such as downloading the map with the app running and switching the `map` directive to load online or offline. What do you think? This could be the subject of a new article.

That's all for today. Leave your comment, whether it's criticism or suggestions.

[project]:          https://github.com/ionixjunior/ionic-offline-maps
[leaflet]:          http://leafletjs.com/
[leaflet-download]: https://leafletjs.com/download.html
[mobac]:            http://mobac.sourceforge.net/
[advice]:           https://wiki.openstreetmap.org/wiki/Blocked_Tiles