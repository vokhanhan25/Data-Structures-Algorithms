uses math;
const fi='EULER.inp';
      fo='EULER2.out';
      maxn=10000;
      maxm=1000000;
type rec=record
     x,y,cs:longint;
     end;
var n,m,top:longint;
e:array [1..maxn] of rec;
head:array [1..maxn] of longint; //cs cung dau tien trong ds cac cung di vao u
link:array [1..2*maxm] of longint; //cs cung ke tiep a[i] trong cung ds lien thuoc
free:array [1..maxm] of boolean;
stack:array [1..maxm+1] of longint;

procedure rf;
var i,j,u,v:longint;
begin
    fillchar (free,sizeof(free),true);
    readln (n,m);
    j:=2*m;
    for i:=1 to m do
    begin
        readln (u,v);
        e[i].x:=u; e[i].y:=v; e[i].cs:=i;
        e[j].x:=v; e[j].y:=u; e[j].cs:=i;
        dec (j);
    end;

    for i:=2*m downto 1 do
     with e[i] do
     begin
         link[i]:=head[y]; // cung dau tien di vao y tro thanh cung thu 2
         head[y]:=i;  //  update cung dau tien di vao y la e[i]
     end;
end;

procedure visit (u:longint);
var i:longint;
begin
    i:=head[u];
    while i<>0 do
     if free[e[i].cs] then
     begin
         free[e[i].cs]:=false;
         visit (e[i].x);
     end else i:=link[i];
    write (u,' ');
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    visit (1);
    close (input); close (output);
end.

