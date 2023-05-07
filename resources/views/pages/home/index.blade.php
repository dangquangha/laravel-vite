<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laravel</title>

    @vite(['resources/ts/crm/assets/css/app.css'])
</head>

<body>
    <div id="root"></div>
    @viteReactRefresh
    @vite(['resources/ts/crm/main.tsx'])
</body>

</html>
