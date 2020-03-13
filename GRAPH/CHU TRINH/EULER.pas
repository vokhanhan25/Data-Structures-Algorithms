uses math;
const fi='EULER.inp';
      fo='EULER.out';
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

procedure euler;
var u,i:longint;
begin
    top:=1; stack[1]:=1; // bo dinh 1 vao ngan xep lam dinh bat dau
    repeat
        u:=stack[top]; // lay phan tu dau cua ngan xep
        i:=head[u]; // cung e[i] dung dau ds lien thuoc
        while (i>0) and not free[e[i].cs] do i:=link[i]; // tim cung trong ds lien thuoc chua bi xoa
        head[u]:=i; // cap nhat cung dau tien trong ds lien thuoc, do cung chua bi xoa
        if i>0 then // con ton tai cung vo huong di vao u chua bi xoa
        begin
            inc (top); stack[top]:=e[i].x; // di nguoc cung e[i], day dinh noi toi u vao ngan xep
            free[e[i].cs]:=false; // xoa canh e[i]
        end
        else begin  // u khong con cung di vao
            write (u,' '); // u thuoc chu trinh euler
            dec (top);  // lay u khoi ngan xep
        end;
    until top=0;  // lap toi khi ngan xep rong
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    euler;
    close (input); close (output);
end.

