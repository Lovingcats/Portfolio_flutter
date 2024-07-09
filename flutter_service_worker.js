'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"version.json": "d4ca0d463411ac0ed6ea5d2df93e3dcd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "46b1e709fc0d2a2e71136d861698a412",
"assets/NOTICES": "30814035d3561f49859efe2e8e19e094",
"assets/AssetManifest.bin": "d8f60f49868b4495ac8be91576f9137d",
"assets/assets/img/gmail.png": "bd1c1240a88c780c3a3dc3b39f837a0a",
"assets/assets/img/PC_20.jpg": "f4cd43c36ebba914efb5c1546b51db04",
"assets/assets/img/05.jpg": "069e8d6d3cfe9fc9941e19fa4747b71f",
"assets/assets/img/showBackground.png": "2432ef4d4ec43d73c81fea63dadcb3c0",
"assets/assets/img/PC_14.jpg": "a6d2ea90d4d2a089636fdda6bf41c822",
"assets/assets/img/github.png": "bd8685b5b79df92d369e0f160a9fca87",
"assets/assets/img/PC_06.jpg": "a725fbfe7d036eb8ca47cdbfb9502929",
"assets/assets/img/PC_13.jpg": "f4144f8294c3bfc8debe679a61331ee3",
"assets/assets/img/03.png": "7de94225182960703814e1af650a14d7",
"assets/assets/img/deviceBackground.png": "da7c516a3cd0184d8f4c08ec1ff9d0c5",
"assets/assets/img/PC_18.jpg": "534ca47ed5461de7637323c88fd5f2f4",
"assets/assets/img/statusBar.png": "db1b10cc0eea0a1db173041a2b678f7d",
"assets/assets/img/background1.png": "923f68af343a94c7226baa3ec4e2adfc",
"assets/assets/img/PC_01.jpg": "70a7121c292fbfc7d912b31a23ab8b37",
"assets/assets/img/PC_10.jpg": "76a79e036e6a3494a04be1f22c61fa7c",
"assets/assets/img/PC_19.jpg": "bfdf760712729b4a4715a90417707e9d",
"assets/assets/img/PC_22.jpg": "85ed8bed82356bc42302df4685eb4667",
"assets/assets/img/recent.png": "7fc25f1763580910d9590606516d5aa2",
"assets/assets/img/PC_21.jpg": "c098f439c579d22119da162cf18d3d9c",
"assets/assets/img/02.png": "095a378f170f1928590848e72a476895",
"assets/assets/img/tistory.png": "a9ecdc12407feea0776509d3aa1aed22",
"assets/assets/img/background.jpg": "599849a7c93b7b47cf8c86a087b4dab3",
"assets/assets/img/PC_26.png": "e1b21bb7167fdc8615889900659fedfa",
"assets/assets/img/PC_23.jpg": "915577e7181dbcf5144f8fc6f78fa19d",
"assets/assets/img/Thumbs.db": "cf83ed3f2a9e7f72a0589447ad8c1727",
"assets/assets/img/PC_05.jpg": "8e7ed2efddcc21fe2eb125db18ca0a48",
"assets/assets/img/PC_03.jpg": "f93cf566b8d96607c43d8e01557408a5",
"assets/assets/img/07.jpg": "dcdf3423ab0afb818beb14efba51442a",
"assets/assets/img/PC_11.jpg": "27c30bed0aff11c1d091380357731334",
"assets/assets/img/PC_15.jpg": "77fa4a6678f4e9464bde99acf91e81a4",
"assets/assets/img/PC_08.jpg": "2391bb00486e96613ca425137bf4670f",
"assets/assets/img/PC_12.jpg": "9ae17f1a779211b4d71672644fb1cdbb",
"assets/assets/img/PC_27.png": "1fb42a13624894626103a010e21884f9",
"assets/assets/img/PC_24.jpg": "fc2333c194921443af624b9a33420ed2",
"assets/assets/img/06.jpg": "922de91e23f8d4d770c4998064edd1cb",
"assets/assets/img/seeAllApp.png": "904966669aed6e95af59ec710d2b9c3e",
"assets/assets/img/PC_25.jpg": "e02811ed04eba5b0647c698a3fcf8462",
"assets/assets/img/PC_04.jpg": "2157c3fd94c69837f5f899276af1453b",
"assets/assets/img/04.png": "179711b6c4866fb2892368d8b302d04f",
"assets/assets/img/PC_17.jpg": "c9f84c25675ef6748abed7c186fc7b4d",
"assets/assets/img/PC_07.jpg": "da2d232ddce604b47a88d55f35ee2909",
"assets/assets/img/tistory1.png": "2b5de74d139291e425b1d2173443529c",
"assets/assets/img/PC_09.jpg": "8eecf36b8cc2856f70f914d76436be79",
"assets/assets/img/brightness.png": "2ee8e572276123e4f6461f43ccf6f58a",
"assets/assets/img/PC_16.jpg": "faf506964955232be3d43614b7378532",
"assets/assets/img/08.jpg": "941d7927635185777ac928cc9ca95ee2",
"assets/assets/img/PC_02.jpg": "b544cf124bc51feee648d7eb7f630b1f",
"assets/assets/img/back.png": "0ee6bdb9050fec3d935ba25b018844eb",
"assets/assets/img/change.png": "4062e71c6a826a25d628b9354c1fe1c3",
"assets/assets/img/01.png": "6b63a86e39b2d9915ac28dbc4bbd3932",
"assets/assets/img/home.png": "81b08adfa82f2f4d0857704e85ce36e6",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "4c0be79964d63a308a134772e5c110bb",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "17ee8e30dde24e349e70ffcdc0073fb0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "1388bcb8292a14585f22a5430a04562c",
"assets/AssetManifest.json": "71f009d94a7830398157ce40a005a690",
"index.html": "a740c449ec7460b63a2145d3d63a981f",
"/": "a740c449ec7460b63a2145d3d63a981f",
"manifest.json": "4c6285d7f20852be01f7ef17cbb20c77"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
