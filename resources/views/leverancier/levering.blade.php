<x-app-layout>
    @if (session('melding'))
        <meta http-equiv="refresh" content="4;url={{ route('leveranciers.producten', $levering->LeverancierId) }}">
    @endif

    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Levering product') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-6">
                @if (session('melding'))
                    <div class="mb-6 rounded-md bg-red-50 border border-red-200 px-4 py-3 text-sm text-red-700">
                        {{ session('melding') }}
                    </div>
                @endif

                <dl class="grid grid-cols-[max-content_1fr] gap-x-4 gap-y-1 mb-6 text-sm">
                    <dt class="text-gray-500">{{ __('Product') }}:</dt>
                    <dd class="font-medium">{{ $levering->ProductNaam }}</dd>
                    <dt class="text-gray-500">{{ __('Leverancier') }}:</dt>
                    <dd class="font-medium">{{ $levering->LeverancierNaam }}</dd>
                    <dt class="text-gray-500">{{ __('Contactpersoon') }}:</dt>
                    <dd class="font-medium">{{ $levering->ContactPersoon }}</dd>
                    <dt class="text-gray-500">{{ __('Mobiel') }}:</dt>
                    <dd class="font-medium">{{ $levering->Mobiel }}</dd>
                </dl>

                <form method="POST" action="{{ route('leveranciers.levering.store', [$levering->LeverancierId, $levering->ProductId]) }}" class="max-w-md space-y-4">
                    @csrf

                    <div>
                        <x-input-label for="aantal" :value="__('Aantal producteenheden')" />
                        <x-text-input id="aantal" name="aantal" type="number" min="1" class="mt-1 block w-full" :value="old('aantal')" required autofocus />
                        <x-input-error :messages="$errors->get('aantal')" class="mt-2" />
                    </div>

                    <div>
                        <x-input-label for="datum_eerstvolgende_levering" :value="__('Datum eerstvolgende levering')" />
                        <x-text-input id="datum_eerstvolgende_levering" name="datum_eerstvolgende_levering" type="date" class="mt-1 block w-full" :value="old('datum_eerstvolgende_levering')" required />
                        <x-input-error :messages="$errors->get('datum_eerstvolgende_levering')" class="mt-2" />
                    </div>

                    <div class="flex items-center justify-between pt-2">
                        <x-primary-button>{{ __('Sla op') }}</x-primary-button>

                        <div class="flex gap-2">
                            <a href="{{ route('leveranciers.producten', $levering->LeverancierId) }}" class="inline-flex items-center px-4 py-2 bg-white border border-gray-300 rounded-md font-semibold text-xs text-gray-700 uppercase tracking-widest shadow-sm hover:bg-gray-50">
                                {{ __('Terug') }}
                            </a>
                            <a href="{{ route('dashboard') }}" class="inline-flex items-center px-4 py-2 bg-white border border-gray-300 rounded-md font-semibold text-xs text-gray-700 uppercase tracking-widest shadow-sm hover:bg-gray-50">
                                {{ __('Home') }}
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>
