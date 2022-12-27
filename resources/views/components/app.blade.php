<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>{{ config('app.name') }} - {{ $title ?? 'Home' }}</title>
        <link type="text/css" rel="stylesheet" href="{{ mix('css/styles.css', 'assets') }}" />
        {{ $links ?? '' }}
    </head>
    <body class="sb-nav-fixed">
        {{ $slot }}
        <script src="{{ mix('js/app.js', 'assets') }}"></script>
        {{ $scripts ?? '' }}
    </body>
</html>
