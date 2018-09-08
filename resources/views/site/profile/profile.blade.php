@extends('site.layouts.app')

@section('title', 'Meu perfil')

@section('content')
    
    <h1>Meu Perfil</h1>
    
    @include('admin.includes.alerts')

    <form action=" {{ route('profile.update') }} " method="POST" enctype="multipart/form-data">
        {!! csrf_field() !!}
        <div class="form-group">
            <label for="name">Nome</label>
            <input type="text" value="{{ auth()->user()->name }}" name="name" placeholder="Nome" class="form-control">
        </div>
        <div class="form-group">
            <label for="name">Email</label>
            <input type="email" value="{{ auth()->user()->email }}" name="email" placeholder="Email" class="form-control">
        </div>
        <div class="form-group">
            <label for="name">Senha</label>
            <input type="password" name="password" placeholder="Senha" class="form-control">
        </div>
        <div class="form-group">
            @if(auth()->user()->image != null)
                <img src="{{ url('storage/users/'.auth()->user()->image) }}" alt="{{ auth()->user()->name }}" style="max-width: 50px;">
            @endif
            <label for="name">Imagem:</label>
            <input type="file" name="image" class="form-control">
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-info">Atualizar Perfil</button>
        </div>
    </form>

@endsection