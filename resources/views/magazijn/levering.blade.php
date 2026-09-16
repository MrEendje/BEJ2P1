<x-app-layout>
    @if (! $heeftVoorraad)
        <meta http-equiv="refresh" content="4;url={{ route('magazijn.index') }}">
    @endif

    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Levering Informatie') }} — {{ $product->Naam }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-6">
                @if (! $heeftVoorraad)
                    <p class="text-gray-700">
                        {{ __('Er is van dit product op dit moment geen voorraad aanwezig, de verwachte eerstvolgende levering is: :datum', [
                            'datum' => $eerstvolgendeLevering?->format('d-m-Y') ?? __('onbekend'),
                        ]) }}
                    </p>
                @else
                    <div class="grid grid-cols-2 sm:grid-cols-4 gap-4 mb-6 text-sm">
                        <div>
                            <div class="text-gray-500">{{ __('Naam leverancier') }}</div>
                            <div class="font-medium">{{ $leverancier?->Naam }}</div>
                        </div>
                        <div>
                            <div class="text-gray-500">{{ __('Contactpersoon leverancier') }}</div>
                            <div class="font-medium">{{ $leverancier?->ContactPersoon }}</div>
                        </div>
                        <div>
                            <div class="text-gray-500">{{ __('Leveranciernummer') }}</div>
                            <div class="font-medium">{{ $leverancier?->LeverancierNummer }}</div>
                        </div>
                        <div>
                            <div class="text-gray-500">{{ __('Mobiel') }}</div>
                            <div class="font-medium">{{ $leverancier?->Mobiel }}</div>
                        </div>
                    </div>

                    <table class="min-w-full divide-y divide-gray-200 text-sm">
                        <thead>
                            <tr class="text-left text-gray-500">
                                <th class="px-4 py-2">{{ __('Datum laatste levering') }}</th>
                                <th class="px-4 py-2">{{ __('Aantal') }}</th>
                                <th class="px-4 py-2">{{ __('Verwachte eerstvolgende levering') }}</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-100">
                            @foreach ($product->leveringen as $levering)
                                <tr>
                                    <td class="px-4 py-2">{{ $levering->DatumLevering->format('d-m-Y') }}</td>
                                    <td class="px-4 py-2">{{ $levering->Aantal }}</td>
                                    <td class="px-4 py-2">{{ $levering->DatumEerstVolgendeLevering?->format('d-m-Y') ?? __('onbekend') }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                @endif

                <p class="mt-6">
                    <a href="{{ route('magazijn.index') }}" class="text-indigo-600 hover:text-indigo-800 underline">
                        {{ __('Terug naar Overzicht Magazijn Jamin') }}
                    </a>
                </p>
            </div>
        </div>
    </div>
</x-app-layout>
