<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Gebruikersbeheer') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">

                    @if (session('status'))
                        <div class="mb-4 rounded-md bg-green-50 p-4 text-sm text-green-700">
                            {{ session('status') }}
                        </div>
                    @endif

                    <table class="min-w-full divide-y divide-gray-200">
                        <thead>
                            <tr class="text-left text-xs font-medium uppercase tracking-wider text-gray-500">
                                <th class="py-3 pr-4">{{ __('Naam') }}</th>
                                <th class="py-3 pr-4">{{ __('E-mail') }}</th>
                                <th class="py-3 pr-4">{{ __('Huidige rol') }}</th>
                                <th class="py-3 pr-4">{{ __('Rol wijzigen') }}</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-100">
                            @foreach ($users as $user)
                                <tr>
                                    <td class="py-3 pr-4 font-medium">{{ $user->name }}</td>
                                    <td class="py-3 pr-4 text-gray-600">{{ $user->email }}</td>
                                    <td class="py-3 pr-4">
                                        <span class="inline-flex rounded-full bg-gray-100 px-2 text-xs font-semibold leading-5 text-gray-800">
                                            {{ $user->role?->label ?? __('Geen rol') }}
                                        </span>
                                    </td>
                                    <td class="py-3 pr-4">
                                        <form method="POST" action="{{ route('admin.users.update', $user) }}" class="flex items-center gap-2">
                                            @csrf
                                            @method('PATCH')
                                            <select name="role_id" class="rounded-md border-gray-300 text-sm">
                                                <option value="">{{ __('Geen rol') }}</option>
                                                @foreach ($roles as $role)
                                                    <option value="{{ $role->id }}" @selected($user->role_id === $role->id)>
                                                        {{ $role->label }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            <x-primary-button>{{ __('Opslaan') }}</x-primary-button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</x-app-layout>
