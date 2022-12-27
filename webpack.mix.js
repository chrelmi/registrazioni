const mix = require('laravel-mix');
require("laravel-mix-clean");

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel applications. By default, we are compiling the CSS
 | file for the application as well as bundling up all the JS files.
 |
 */
 mix.disableNotifications();
 mix.setPublicPath("public/assets").clean();

 mix.sass("resources/css/styles.scss", "css")
    .sourceMaps();

mix.js("resources/js/app.js", "js")

mix.autoload({

        "popper.js": ["Popper", "window.Popper"],
    })
    .extract(["popper.js", "bootstrap"], "js/bootstrap.js")
    .extract();