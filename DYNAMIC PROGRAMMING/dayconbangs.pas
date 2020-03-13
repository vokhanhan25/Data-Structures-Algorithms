Const fi='NTSEQS.inp';
      fo='NTSEQS.out';
Var n,s:longint;
trace,a,L:array [0..100] of longint;
free:array [0..100] of boolean;
procedure docfile;
var i:longint;
begin
    Readln (n,s);
    for i:=1 to n do read (a[i]);
    fillchar (free,sizeof(free),true);
end;

procedure xuli;
var i,t,tm:longint;
begin
    L[s]:=0;
    L[0]:=1;
    for i:=1 to n do
     for t:=s downto a[i] do
      if (L[t]=0) and (L[t-a[i]]=1) then
      begin
           L[t]:=1;
           trace[t]:=i;
       end;
     writeln (L[s]);
     t:=s;
     while t>0 do
     begin
          write (a[trace[t]],' ');
          t:=t-a[trace[t]];
     end;
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    docfile;
    xuli;
    close (input); close (output);
end.
