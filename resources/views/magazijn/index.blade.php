<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Overzicht Magazijn Jamin') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-6">
                @if (session('status'))
                    <div class="mb-4 text-sm text-green-600">
                        {{ session('status') }}
                    </div>
                @endif

                <table class="min-w-full divide-y divide-gray-200 text-sm">
                    <thead>
                        <tr class="text-left text-gray-500">
                            <th class="px-4 py-2">{{ __('Barcode') }}</th>
                            <th class="px-4 py-2">{{ __('Naam') }}</th>
                            <th class="px-4 py-2">{{ __('Aantal aanwezig') }}</th>
                            <th class="px-4 py-2 text-center">{{ __('Leverantie Info') }}</th>
                            <th class="px-4 py-2 text-center">{{ __('Allergenen Info') }}</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100">
                        @foreach ($producten as $product)
                            <tr>
                                <td class="px-4 py-2">{{ $product->Barcode }}</td>
                                <td class="px-4 py-2">{{ $product->Naam }}</td>
                                <td class="px-4 py-2">{{ $product->magazijn?->AantalAanwezig ?? __('Geen voorraad') }}</td>
                                <td class="px-4 py-2 text-center">
                                    <a href="{{ route('magazijn.levering', $product) }}"
                                       title="{{ __('Leverantie Info') }}"
                                       class="inline-flex items-center justify-center w-7 h-7 rounded-full bg-blue-100 text-blue-700 hover:bg-blue-200">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M9.879 7.519c1.171-1.025 3.071-1.025 4.242 0 1.172 1.025 1.172 2.687 0 3.712-.203.179-.43.326-.67.442-.745.361-1.45.999-1.45 1.827v.75M21 12a9 9 0 11-18 0 9 9 0 0118 0Zm-9 5.25h.008v.008H12v-.008Z" />
                                        </svg>
                                    </a>
                                </td>
                                <td class="px-4 py-2 text-center">
                                    <a href="{{ route('magazijn.allergenen', $product) }}"
                                       title="{{ __('Allergenen Info') }}"
                                       class="inline-flex items-center justify-center w-7 h-7 rounded-full bg-red-100 text-red-700 hover:bg-red-200">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M9.75 9.75l4.5 4.5m0-4.5l-4.5 4.5M21 12a9 9 0 11-18 0 9 9 0 0118 0Z" />
                                        </svg>
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</x-app-layout>
