const   fi='capghepmin.inp';
        nmax=200;
        vc=100000000;
type    data=longint;
var
        f:text;
        A:array[0..nmax+1,0..nmax+1] of data;
        Fx,Fy,MatchX,MatchY,tr:array[0..nmax+1] of data;
        Q:array[0..nmax*nmax] of data;
        ddx,ddy:array[0..nmax+1] of boolean;
        dau,cuoi,start,finish:data;
        n:data;
procedure docfile;
var     i,j,u,v,c:data;
begin
        assign(f,fi); reset(f);
        readln(f,n);
        for i:=1 to n do
           for j:=1 to n do  a[i,j]:=vc;
        while not eof(f) do
              begin
                    readln(f,u,v,c);
                    a[u,v]:=c;
                end;
        close(f);
end;

procedure init;
var     i,j:data;
begin
        fillchar(MatchX,sizeof(matchx),0);
        MatchY:=MatchX;
        for i:=1 to n do
        begin
           fx[i]:=vc;
           for j:=1 to n do
              if fx[i]>a[i,j] then  fx[i]:=a[i,j];
        end;
        for i:=1 to n do
        begin
           fy[i]:=vc;
           for j:=1 to n do
              if a[i,j]-fx[i]<fy[i] then fy[i]:=a[i,j]-fx[i];
        end;
end;
function get(i,j:data):data;
begin
       get:=a[i,j]-fx[i]-fy[j];
end;
procedure themvao(x:data);
begin
        inc(cuoi);
        q[cuoi]:=x;
end;
function layra:data;
begin
        layra:=q[dau];
        inc(dau);
end;
procedure bfs;
var     u,v,j,i:data;
begin
        fillchar(tr,sizeof(tr),0);
        dau:=1;
        cuoi:=0;
        themvao(start);
        while dau<=cuoi do
        begin
           u:=layra;
           for v:=1 to n do
              if (tr[v]=0) and (get(u,v)=0) then
              begin
                 tr[v]:=u;
                 if matchy[v]=0 then
                 begin
                    finish:=v;
                    exit;
                 end;
               themvao(matchy[v]);
              end;
        end;
end;

procedure enlager(u:data);
var     v,next:data;
begin
        repeat
          v:=tr[u];
          next:=MatchX[v];
          MatchX[v]:=u;
          MatchY[u]:=v;
          u:=next;
        until   u=0;
end;
procedure subX_addY;
var     i,j,delta:data;
begin
        fillchar(ddx,sizeof(ddx),false);
        ddy:=ddx;
        ddx[start]:=true;
        for i:=1 to n do
        if tr[i]<>0 then
        begin
            ddx[MatchY[i]]:=true;
            ddy[i]:=true;
        end;
        delta:=vc;
        for i:=1 to n do
        if ddx[i] then
           for j:=1 to n do
              if (not ddy[j]) and (delta>get(i,j)) then delta:=get(i,j);
        for i:=1 to n do
        begin
            if ddx[i] then fx[i]:=fx[i]+delta;
            if ddy[i] then fy[i]:=fy[i]-delta;
        end;
end;
procedure xuli;
var     i,j,res:data;
begin
        for i:=1 to n do
        begin
            start:=i;
            finish:=0;
            repeat
                bfs;
                if finish=0 then subx_addy;
            until finish<>0;
            enlager(finish);
        end;
        res:=0;
        for i:=1 to n do
           if MatchX[i]<>0 then
              inc(res,a[i,Matchx[i]]);
        writeln(res);
        for i:=1 to n do
           if MatchX[i]<>0 then
              writeln(i, ' ',MatchX[i]);
  end;
begin
   docfile;
   init;
   xuli;
   readln;
end.
