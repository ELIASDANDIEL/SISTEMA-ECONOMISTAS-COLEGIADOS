<?php

namespace App\Http\Middleware;

use Closure;
use App\Http\Helpers\MiAuthManager;

class MiAuthMiddleware
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
        $helper = new MiAuthManager($request);

        $usuario = $helper->checkWithToken();

        if(is_null($usuario))
            return response()->json(['success' => false , 'message' => 'No autorizado'],401);

        return $next($request);
    }
}