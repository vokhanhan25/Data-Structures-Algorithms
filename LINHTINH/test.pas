{$mode objfpc}
// Thu vi?n dos ch?a l?nh exec
uses dos;
const
    // T^n chuong tr?nh
    NAM = 'VODIVIDE';
    // S? test ki?m tra
    NTEST = 10;
var
    iTest: integer;

begin
    for iTest := 1 to NTEST do
    begin
        // Pascal kh"ng g?p v?n d? v?i randomize, v? v?y ta c› th? tÿch tr?nh sinh test ri^ng ra.
        Exec(NAM + '_sinhtest.exe', '');
        Exec(NAM + '.exe', '');
        Exec(NAM + '_trau.exe', '');
	    Exec('fc', NAM + '.out ' + NAM + '.ans');

        if DosExitCode <> 0 then
        begin
            writeln('Test ', iTest, ': WRONG!');
            exit;
        end;
        writeln('Test ', iTest, ': CORRECT!');
    end;
end.
