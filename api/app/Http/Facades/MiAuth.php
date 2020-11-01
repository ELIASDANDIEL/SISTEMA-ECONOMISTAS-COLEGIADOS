<?php 
namespace App\Http\Facades;

use Illuminate\Support\Facades\Facade;

class MiAuth extends Facade 
{
	protected static function getFacadeAccessor()
    {
        return 'miauth';
    }
}