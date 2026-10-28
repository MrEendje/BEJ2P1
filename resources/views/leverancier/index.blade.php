<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Overzicht leveranciers') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-6">
                <table class="min-w-full divide-y divide-gray-200 text-sm">
                    <thead>
                        <tr class="text-left text-gray-500">
                            <th class="px-4 py-2">{{ __('Naam') }}</th>
                            <th class="px-4 py-2">{{ __('Contactpersoon') }}</th>
                            <th class="px-4 py-2">{{ __('Leveranciernummer') }}</th>
                            <th class="px-4 py-2">{{ __('Mobiel') }}</th>
                            <th class="px-4 py-2">{{ __('Aantal verschillende producten') }}</th>
                            <th class="px-4 py-2 text-center">{{ __('Toon producten') }}</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100">
                        @foreach ($leveranciers as $leverancier)
                            <tr>
                                <td class="px-4 py-2">{{ $leverancier->Naam }}</td>
                                <td class="px-4 py-2">{{ $leverancier->ContactPersoon }}</td>
                                <td class="px-4 py-2">{{ $leverancier->LeverancierNummer }}</td>
                                <td class="px-4 py-2">{{ $leverancier->Mobiel }}</td>
                                <td class="px-4 py-2">{{ $leverancier->AantalVerschillendeProducten }}</td>
                                <td class="px-4 py-2 text-center">
                                    <a href="{{ route('leveranciers.producten', $leverancier->Id) }}"
                                       title="{{ __('Toon producten') }}"
                                       class="inline-flex items-center justify-center w-7 h-7 rounded-full bg-indigo-100 text-indigo-700 hover:bg-indigo-200">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="m21 7.5-9-5.25L3 7.5m18 0-9 5.25m9-5.25v9l-9 5.25M3 7.5l9 5.25M3 7.5v9l9 5.25m0-9v9" />
                                        </svg>
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>

                <div class="mt-6 flex justify-end">
                    <a href="{{ route('dashboard') }}" class="inline-flex items-center px-4 py-2 bg-white border border-gray-300 rounded-md font-semibold text-xs text-gray-700 uppercase tracking-widest shadow-sm hover:bg-gray-50">
                        {{ __('Home') }}
                    </a>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
