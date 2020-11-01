<?php

namespace App\Http\Middleware;

use Closure;
use MiAuth;

class CheckEnabled
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        // if (MiAuth::user()->enabled == false) 
        //    return response()->json(['success' => false , 'message' => 'Cuenta desactivada'],401);

        return $next($request);
    }
}
