<x-app-layout>
    @if (empty($producten))
        <meta http-equiv="refresh" content="3;url={{ route('leveranciers.index') }}">
    @endif

    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Geleverde producten') }}
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

                <dl class="grid grid-cols-[max-content_1fr] gap-x-4 gap-y-1 mb-6 text-sm">
                    <dt class="text-gray-500">{{ __('Naam leverancier') }}:</dt>
                    <dd class="font-medium">{{ $leverancier->Naam }}</dd>
                    <dt class="text-gray-500">{{ __('Contactpersoon') }}:</dt>
                    <dd class="font-medium">{{ $leverancier->ContactPersoon }}</dd>
                    <dt class="text-gray-500">{{ __('Leveranciernummer') }}:</dt>
                    <dd class="font-medium">{{ $leverancier->LeverancierNummer }}</dd>
                    <dt class="text-gray-500">{{ __('Mobiel') }}:</dt>
                    <dd class="font-medium">{{ $leverancier->Mobiel }}</dd>
                </dl>

                <table class="min-w-full divide-y divide-gray-200 text-sm">
                    <thead>
                        <tr class="text-left text-gray-500">
                            <th class="px-4 py-2">{{ __('Naam product') }}</th>
                            <th class="px-4 py-2">{{ __('Aantal in magazijn') }}</th>
                            <th class="px-4 py-2">{{ __('Verpakkingseenheid') }}</th>
                            <th class="px-4 py-2">{{ __('Laatste levering') }}</th>
                            <th class="px-4 py-2 text-center">{{ __('Nieuwe levering') }}</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100">
                        @forelse ($producten as $product)
                            <tr>
                                <td class="px-4 py-2">{{ $product->Naam }}</td>
                                <td class="px-4 py-2">{{ $product->AantalAanwezig ?? __('Geen voorraad') }}</td>
                                <td class="px-4 py-2">{{ str_replace('.', ',', rtrim(rtrim((string) $product->VerpakkingsEenheid, '0'), '.')) }} kg</td>
                                <td class="px-4 py-2">{{ \Illuminate\Support\Carbon::parse($product->LaatsteLevering)->format('d-m-Y') }}</td>
                                <td class="px-4 py-2 text-center">
                                    <a href="{{ route('leveranciers.levering.create', [$leverancier->Id, $product->ProductId]) }}"
                                       title="{{ __('Nieuwe levering') }}"
                                       class="inline-flex items-center justify-center w-7 h-7 rounded-full bg-green-100 text-green-700 hover:bg-green-200">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-4 h-4">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                                        </svg>
                                    </a>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="5" class="px-4 py-6 text-center text-gray-700">
                                    {{ __('Dit bedrijf heeft tot nu toe geen producten geleverd aan Jamin') }}
                                </td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>

                <div class="mt-6 flex justify-end gap-2">
                    <a href="{{ route('leveranciers.index') }}" class="inline-flex items-center px-4 py-2 bg-white border border-gray-300 rounded-md font-semibold text-xs text-gray-700 uppercase tracking-widest shadow-sm hover:bg-gray-50">
                        {{ __('Terug') }}
                    </a>
                    <a href="{{ route('dashboard') }}" class="inline-flex items-center px-4 py-2 bg-white border border-gray-300 rounded-md font-semibold text-xs text-gray-700 uppercase tracking-widest shadow-sm hover:bg-gray-50">
                        {{ __('Home') }}
                    </a>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
