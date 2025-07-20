<?php

declare(strict_types=1);

$providers = [
    App\Providers\AppServiceProvider::class,
    App\Providers\Filament\AdminPanelServiceProvider::class,
];

if (class_exists(Laravel\Telescope\TelescopeServiceProvider::class)) {
    $providers[] = App\Providers\TelescopeServiceProvider::class;
}

return $providers;
