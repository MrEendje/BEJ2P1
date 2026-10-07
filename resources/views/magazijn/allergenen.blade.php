<x-app-layout>
    @if ($allergenen->isEmpty())
        <meta http-equiv="refresh" content="4;url={{ route('magazijn.index') }}">
    @endif

    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Overzicht Allergenen') }} - {{ $product->Naam }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-6">
                @if ($allergenen->isNotEmpty())
                    <div class="grid grid-cols-2 gap-4 mb-6 text-sm">
                        <div>
                            <div class="text-gray-500">{{ __('Naam Product') }}</div>
                            <div class="font-medium">{{ $product->Naam }}</div>
                        </div>
                        <div>
                            <div class="text-gray-500">{{ __('Barcode') }}</div>
                            <div class="font-medium">{{ $product->Barcode }}</div>
                        </div>
                    </div>
                @endif

                <table class="min-w-full divide-y divide-gray-200 text-sm">
                    <thead>
                        <tr class="text-left text-gray-500">
                            <th class="px-4 py-2">{{ __('Naam') }}</th>
                            <th class="px-4 py-2">{{ __('Omschrijving') }}</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100">
                        @foreach ($allergenen as $allergeen)
                            <tr>
                                <td class="px-4 py-2">{{ $allergeen->Naam }}</td>
                                <td class="px-4 py-2">{{ $allergeen->Omschrijving }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>

                <p class="mt-6">
                    <a href="{{ route('magazijn.index') }}" class="text-indigo-600 hover:text-indigo-800 underline">
                        {{ __('Terug naar Overzicht Magazijn Jamin') }}
                    </a>
                </p>
            </div>
        </div>
    </div>
</x-app-layout>
