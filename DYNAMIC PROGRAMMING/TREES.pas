uses math;
Const
  fi ='TREES.inp';
  fo ='TREES.out';
maxn=100001;
Var n,res:longint;
t,p,a:array [0..maxn+1] of longint;
Procedure docfile;
Var i:longint;
Begin
   Readln (n);
   For i:=1 to n do Read (a[i]);
End;

procedure pr;
var i,j:longint;
begin
    t[1]:=a[1];
    for i:=2 to n do t[i]:=min(t[i-1],a[i]);
    p[n]:=a[n];
    for i:=n-1 downto 1 do p[i]:=max(p[i+1],a[i]);
    res:=-1; i:=1; j:=1;
    while (i<=n) and (j<=n) do
    begin
        if t[i]<p[j] then
        begin
            res:=max(res,j-i);
            inc (j);
        end
        else inc (i);
    end;
    write (res);
end;

Begin
   Assign (input,fi); Reset (input);
   Assign (output,fo); Rewrite (output);
   docfile;
   pr;
   Close (input); Close (output);
End.



