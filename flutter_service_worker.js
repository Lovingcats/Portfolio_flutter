'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"manifest.json": "4c6285d7f20852be01f7ef17cbb20c77",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "e7da0ac69103dd1770c191d031e0eec8",
"version.json": "d4ca0d463411ac0ed6ea5d2df93e3dcd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "7a04dc416068182679723aadecdfc168",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "17ee8e30dde24e349e70ffcdc0073fb0",
"assets/NOTICES": "87610ed06213fb8eaf835d35cc3e3639",
"assets/AssetManifest.bin": "1bea9ecd74cfc3846cf035a88d3fb3d5",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.bin.json": "273f5575e5384a269c7b77e88606ad04",
"assets/assets/img/PC_19.jpg": "bfdf760712729b4a4715a90417707e9d",
"assets/assets/img/04.png": "179711b6c4866fb2892368d8b302d04f",
"assets/assets/img/PC_25.jpg": "e02811ed04eba5b0647c698a3fcf8462",
"assets/assets/img/PC_02.jpg": "b544cf124bc51feee648d7eb7f630b1f",
"assets/assets/img/PC_07.jpg": "da2d232ddce604b47a88d55f35ee2909",
"assets/assets/img/home.png": "81b08adfa82f2f4d0857704e85ce36e6",
"assets/assets/img/07.jpg": "dcdf3423ab0afb818beb14efba51442a",
"assets/assets/img/PC_10.jpg": "76a79e036e6a3494a04be1f22c61fa7c",
"assets/assets/img/PC_18.jpg": "534ca47ed5461de7637323c88fd5f2f4",
"assets/assets/img/wutheringWaves/4.png": "ffd4a9b67d6dc3e86105676675040da2",
"assets/assets/img/wutheringWaves/2.png": "bffb8670c2e4e3142cb2c625e55194f0",
"assets/assets/img/wutheringWaves/5.png": "8de0aab434ab62541a9316075abd9721",
"assets/assets/img/wutheringWaves/3.png": "f38e0c3b5836a28455ddc1b76ff05916",
"assets/assets/img/wutheringWaves/6.png": "1444f21a452781502d64e8433714ec8d",
"assets/assets/img/wutheringWaves/1.png": "83cefdec6c9fa29ec875aae2ba5116e5",
"assets/assets/img/tistory1.png": "2b5de74d139291e425b1d2173443529c",
"assets/assets/img/arkNights/4.png": "06c5d9f8516fe6945e4ac41f47f643cb",
"assets/assets/img/arkNights/2.png": "e3007524e978a39c7f5ee91860ae313d",
"assets/assets/img/arkNights/5.png": "f8e9c8ec4b8d7557002a18dfcffe3fb5",
"assets/assets/img/arkNights/3.png": "9236212f1f40064939386e0d7bba1c66",
"assets/assets/img/arkNights/6.png": "6506a3190da5388f2ba170d9ec1a47f1",
"assets/assets/img/arkNights/1.png": "5f05eb9e2c64d44d9602e63404c880be",
"assets/assets/img/PC_13.jpg": "f4144f8294c3bfc8debe679a61331ee3",
"assets/assets/img/blueArchive/4.png": "ccc991ca579196317b51788390305130",
"assets/assets/img/blueArchive/2.png": "4bdd59dccbf41c159fc02c21f0611e74",
"assets/assets/img/blueArchive/5.png": "644d58efe96115ca1c5b4b2a3e1303b1",
"assets/assets/img/blueArchive/7.png": "759b604478ccc8bdf53c490164b65d56",
"assets/assets/img/blueArchive/3.png": "2e39cf2376e39cc553da4a4c9ec2f1ca",
"assets/assets/img/blueArchive/6.png": "cfb919e2373928418d71f3796f9c6859",
"assets/assets/img/blueArchive/1.png": "2391bb00486e96613ca425137bf4670f",
"assets/assets/img/seeAllApp.png": "904966669aed6e95af59ec710d2b9c3e",
"assets/assets/img/01.png": "6b63a86e39b2d9915ac28dbc4bbd3932",
"assets/assets/img/PC_09.jpg": "8eecf36b8cc2856f70f914d76436be79",
"assets/assets/img/back.png": "0ee6bdb9050fec3d935ba25b018844eb",
"assets/assets/img/PC_24.jpg": "fc2333c194921443af624b9a33420ed2",
"assets/assets/img/change.png": "4062e71c6a826a25d628b9354c1fe1c3",
"assets/assets/img/PC_22.jpg": "85ed8bed82356bc42302df4685eb4667",
"assets/assets/img/showBackground.png": "2432ef4d4ec43d73c81fea63dadcb3c0",
"assets/assets/img/05.jpg": "069e8d6d3cfe9fc9941e19fa4747b71f",
"assets/assets/img/03.png": "7de94225182960703814e1af650a14d7",
"assets/assets/img/PC_21.jpg": "c098f439c579d22119da162cf18d3d9c",
"assets/assets/img/github.png": "bd8685b5b79df92d369e0f160a9fca87",
"assets/assets/img/tistory.png": "a9ecdc12407feea0776509d3aa1aed22",
"assets/assets/img/PC_17.jpg": "c9f84c25675ef6748abed7c186fc7b4d",
"assets/assets/img/02.png": "095a378f170f1928590848e72a476895",
"assets/assets/img/PC_26.png": "e1b21bb7167fdc8615889900659fedfa",
"assets/assets/img/statusBar.png": "db1b10cc0eea0a1db173041a2b678f7d",
"assets/assets/img/PC_04.jpg": "2157c3fd94c69837f5f899276af1453b",
"assets/assets/img/catBackground.jpg": "d85791c01b2f56db2e87bea6331cff4d",
"assets/assets/img/PC_16.jpg": "faf506964955232be3d43614b7378532",
"assets/assets/img/gmail.png": "bd1c1240a88c780c3a3dc3b39f837a0a",
"assets/assets/img/PC_05.jpg": "8e7ed2efddcc21fe2eb125db18ca0a48",
"assets/assets/img/PC_23.jpg": "915577e7181dbcf5144f8fc6f78fa19d",
"assets/assets/img/PC_27.png": "1fb42a13624894626103a010e21884f9",
"assets/assets/img/PC_15.jpg": "77fa4a6678f4e9464bde99acf91e81a4",
"assets/assets/img/background.jpg": "599849a7c93b7b47cf8c86a087b4dab3",
"assets/assets/img/PC_06.jpg": "a725fbfe7d036eb8ca47cdbfb9502929",
"assets/assets/img/PC_03.jpg": "f93cf566b8d96607c43d8e01557408a5",
"assets/assets/img/PC_01.jpg": "70a7121c292fbfc7d912b31a23ab8b37",
"assets/assets/img/PC_11.jpg": "27c30bed0aff11c1d091380357731334",
"assets/assets/img/deviceBackground.png": "da7c516a3cd0184d8f4c08ec1ff9d0c5",
"assets/assets/img/Thumbs.db": "cf83ed3f2a9e7f72a0589447ad8c1727",
"assets/assets/img/PC_12.jpg": "9ae17f1a779211b4d71672644fb1cdbb",
"assets/assets/img/recent.png": "7fc25f1763580910d9590606516d5aa2",
"assets/assets/img/background1.png": "923f68af343a94c7226baa3ec4e2adfc",
"assets/assets/img/08.jpg": "941d7927635185777ac928cc9ca95ee2",
"assets/assets/img/PC_14.jpg": "a6d2ea90d4d2a089636fdda6bf41c822",
"assets/assets/img/PC_20.jpg": "f4cd43c36ebba914efb5c1546b51db04",
"assets/assets/img/06.jpg": "922de91e23f8d4d770c4998064edd1cb",
"assets/assets/img/brightness.png": "2ee8e572276123e4f6461f43ccf6f58a",
"assets/assets/lottie/loading.json": "89a4ca2fd061534833bd1ecae12de0be",
"assets/fonts/MaterialIcons-Regular.otf": "75ad1894c2a9f295627ccdf7a44d5bc6",
"assets/AssetManifest.json": "6090caf208a508d7cf00027b40491938",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"index.html": "a740c449ec7460b63a2145d3d63a981f",
"/": "a740c449ec7460b63a2145d3d63a981f",
"main.dart.js": "3e9a3ac0984a94c3411e741694b876b9"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
