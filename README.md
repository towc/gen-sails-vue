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

Thanks to the [custom template](https://github.com/towc/vue-template-webpack-sails), vue will

 - automatically watch for file changes
 - build to sails' assets folder
 - have a router in history mode by default
 - disable ESLint by default 
 
Note that you can still write `y` at the prompt, as well as change anything else. Nothing is really crucial for the rest of the system to work, but ESLint is known to be buggy right now and not consistent, and that's the only option I usually change when using vue, so now I can press `ENTER` all the way through the setup, unless I want something different, so I hope this helps you too

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
const pathObject = [ '/', '/login', '/whatever/:even/with/:parameters', ... ]
        .reduce( ( acc, path ) => { acc[ path ] = 'Vue.serve'; return acc }, {} );

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

If you stopped the project from running and want it to start again, all you need to do to get the vue watcher going again is, in another terminal, `cd frontend && npm run build`, and it will just watch. As always, just do `<Ctrl-c>` to stop the watcher

In order to deploy to heroku or mostly any service, all you need to do is send the `backend` folder over, you don't need anything from the vue side, as it's all compiled on `backend/assets`
