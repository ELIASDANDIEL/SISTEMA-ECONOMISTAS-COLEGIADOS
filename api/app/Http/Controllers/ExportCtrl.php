<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Traits\ColegiadoQuery;
use App\Exports\{ColegiadoExport};
use Excel;

class ExportCtrl extends Controller
{
    use ColegiadoQuery;

    public function exportColegiadosExcel(Request $request)
    {
        try 
        {
            return Excel::download(
                new ColegiadoExport($this->colegiadoQuery($request)), 
                "colegiados.xlsx"
            );
    	} 
        catch (\Exception $e) 
        {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
    	}
    }

    public function exportColegiadosPdf(Request $request)
    {
        try 
        {
            $data = [
                'colegiados' => $this->colegiadoQuery($request)
            ];
         
            $pdf = \PDF::loadView('format.colegiados',$data);
         
            return $pdf->download('colegiados.pdf');
    	} 
        catch (\Exception $e) 
        {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
    	}
    }
}
