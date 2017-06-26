# gen-sails-vue
Generate a sails/vue app with not much effort and in a short amount of time!

```bash
git clone https://github.com/towc/gen-sails-vue
mv -f gen-sails-vue project-name
cd project-name
./create.sh
```

## what it does
This solves a couple of basic totally automatable setup issues

 - spawns a new terminal to initiate vue with a custom template
 - in parallel generates the sails app on the main terminal
 - generates a controller and adds an action (Vue.serve)
 - call `npm run build` on the vue terminal

Thanks to the [custom template](https://github.com/towc/vue-template-sails-webpack), vue will

 - automatically watch for file changes
 - build to sails' assets folder

The final directory structure will look as simple as this:

```
project-name
 - backend (sails)
 - frontend (vue)
```

## what you do
In order to get the paths to work, I don't like catching every single route or using the history fallback api: if something 404s, it should 404 properly!

So, inside of `backend/config/routes.js`, you have some option, but what you're basically trying to do is make every path you need point to `'Vue.serve'`. This is my preferred way to do it:

```js
const pathObject = [ '/', '/login', '/whatever/:even/with/:parameters', ... ].reduce( ( acc, path ) => { acc[ path ] = 'Vue.serve'; return acc }, {} );

module.exports.routes = Object.assign( pathObject, {
  'post /api/stuff': 'Whatever.action',
  'get /api/dogs': 'Very.cute',
  ...
});
```

All this achieves is to export an object like:

```js
module.exports.routes = {
  '/': 'Vue.serve',
  '/login': 'Vue.serve',
  ...
  
  'post /api/stuff': 'Whatever.action',
  'get /api/dogs': 'Very.cute',
  ...
});
```

And the rest is up to you! You can change the vue files like you normally would, and just `sails lift` whenever you change the backend code, and do a page reload when you've changed the frontend code :)
