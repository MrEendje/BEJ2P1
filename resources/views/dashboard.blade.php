<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900 space-y-2">
                    <p>{{ __("You're logged in!") }}</p>
                    <p>
                        {{ __('Ingelogd als') }}: <strong>{{ Auth::user()->name }}</strong>
                    </p>
                    <p>
                        {{ __('Rol') }}:
                        <span class="inline-flex rounded-full bg-indigo-100 px-2 text-xs font-semibold leading-5 text-indigo-800">
                            {{ Auth::user()->role?->label ?? __('Geen rol') }}
                        </span>
                    </p>
                    @if (Auth::user()->isAdmin())
                        <p class="text-sm text-gray-600">
                            {{ __('Je hebt beheerdersrechten — het menu Gebruikersbeheer is zichtbaar.') }}
                        </p>
                    @endif
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
