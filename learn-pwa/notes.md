# PWA Notes

All I need to make a web app PWA is a [manifest file](https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable#the_web_app_manifest). At runtime, I must serve the app from `https` or `localhost`. 

Existing documentation highlights that PWAs should be able to work in offline mode and therefore use Service Worker APIs for caching. For my beginning journey I am going to ignore that. As I get more comfortable with building these apps I'll add in an intercept/proxy layer that will intercept all fetch requests and check the cache.

Building a PWA app really comes down to building a web app. 