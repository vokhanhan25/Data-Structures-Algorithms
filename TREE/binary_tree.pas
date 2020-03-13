uses math;
Const fi ='BINARY.inp';
      fo ='BINARY.out';
      maxn=100000;
type rec=record
     l,r,nd:longint;
     end;
Var n:longint;
t,a,h:array [1..maxn] of longint;

procedure insert (i,x:longint);
begin
    if t[i]=0 then
    begin
       t[i]:=x;
       if i<>1 then inc (h[i div 2]);
    end
    else if x>t[i] then insert (2*i+1,x)
    else insert (2*i,x);
end;

Procedure rf;
Var i:longint;
Begin
    Readln (n);
    for i:=1 to n do
    begin
        read (a[i]);
        insert (1,a[i]);
    end;
end;

procedure duyettruoc (i:longint);
begin
    if t[i]<>0 then
    begin
        write (t[i],' ');
        duyettruoc (i*2);
        duyettruoc (i*2+1);
    end;
end;

procedure duyetgiua (i:longint);
begin
    if t[i]<>0 then
    begin
        duyetgiua (i*2);
        write (t[i],' ');
        duyetgiua (i*1);
    end;
end;

procedure duyetsau (i:longint);
begin
    if t[i]<>0 then
    begin
        duyetsau (i*2);
        duyetsau (i*2+1);
        write (t[i],' ');
    end;
end;

function docao (i:longint):longint;
begin
    if t[i]=0 then docao:=0
    else docao:=max(docao(i*2),docao(i*2+1))+1;
end;

function sonut (i:longint):longint;
begin
    if t[i]=0 then sonut:=0
    else sonut:=sonut(i*2)+sonut(i*2+1)+1;
end;

procedure pr;
var i:longint;
begin
    duyettruoc (1);
    writeln;
    for i:=1 to n do write (sonut(i),' ');

end;

Begin
   Assign (input,fi); Reset (input);
   Assign (output,fo); Rewrite (output);
   rf;
   pr;
   Close (input); Close (output);
End.


