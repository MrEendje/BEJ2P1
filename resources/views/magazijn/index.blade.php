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
                                       class="inline-flex items-center justify-center w-6 h-6 rounded-full bg-blue-100 text-blue-700 font-bold hover:bg-blue-200">
                                        ?
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
