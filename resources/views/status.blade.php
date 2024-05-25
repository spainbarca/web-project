<x-app-layout>
    <x-container>
        <h1 class="mb-4 text-white">Friend Requests</h1>
        @foreach ($requests as $user)
            <x-card class="mb-4">
                <div class="flex justify-between">
                    {{ $user->name}}
                    <form action="{{ route('friends.update', $user) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <x-submit-button>Confirm</x-submit-button>
                    </form>
                </div>
            </x-card>
        @endforeach
        <br><br>
        <h1 class="mb-4 text-white">Sent Requests</h1>
        @foreach ($sent as $user)
            <x-card class="mb-4">
                {{ $user->name}}
            </x-card>
        @endforeach
    </x-container>
</x-app-layout>
