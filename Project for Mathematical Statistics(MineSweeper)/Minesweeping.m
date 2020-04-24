% success=zeros(20*5*5,1);
% failure=zeros(20*5*5,1);
% afailure=0;
% asuccess=0;
% q=0.1;
% num2=zeros(20*5*5,3);
% counting2=1;
% for p=2000:400:2400
%     for pp=0.2:0.2:1
%         if p==2000&&pp==0.2
%             continue
%         end
%         for q=0.08:0.02:0.18
% success(counting2)=asuccess;
% failure(counting2)=afailure;
% afailure=0;                                                     
% asuccess=0;


time=0;
%规定地雷是-1，空格是0
%地雷数量为num
% ratio=pp;
% mianji=p;
% row=round(sqrt(mianji/ratio));
% col=round(sqrt(mianji*ratio));
row=20;
col=20;
num=80;
% num=round(mianji*q);
% num2(counting2,1)=row;
% num2(counting2,2)=col;
% num2(counting2,3)=num;
% counting2=counting2+1;
% while(time<2000)
time=time+1;
%global flag;
n=0; %有数字的格子的个数
showfield=zeros(row,col);
minenum=zeros(row,col);
count=0;
minefield=rand(row,col);
[temp,index]=sort(minefield(:));
minefield=(minefield<=minefield(index(num)));

showfield=-ones(row,col);
for i=-2:1:8
    showfield(i+3)=i;
end
imh = image(showfield,'CDataMapping','scaled');
set(imh,'erasemode','none');
colorbar
axis equal
axis tight

%确保第一个点，即中间那个点不是雷
%{
while minefield(row/2,col/2)==1
    minefield=rand(row,col);
    [temp,index]=sort(minefield(:));
    minefield=(minefield<=minefield(index(num)));
end
%}

for i=1:row
    for j=1:col
      x1=i-1;y1=j-1;
      x2=i-1;y2=j;
      x3=i-1;y3=j+1;
      
      x4=i;  y4=j-1;
      x5=i;  y5=j+1;
      
      x6=i+1;y6=j-1;
      x7=i+1;y7=j;
      x8=i+1;y8=j+1;
      
      if x1>0&&y1>0
          if minefield(x1,y1)==1
              count=count+1;
          end
      end
      if x2>0
          if minefield(x2,y2)==1
              count=count+1;
          end
      end
      if x3>0&&y3<col+1
          if minefield(x3,y3)==1
              count=count+1;
          end
      end
      if y4>0
          if minefield(x4,y4)==1
              count=count+1;
          end
      end
      if y5<col+1
          if minefield(x5,y5)==1
              count=count+1;
          end
      end
      if x6<row+1&&y6>0
          if minefield(x6,y6)==1
              count=count+1;
          end
      end
      if x7<row+1
          if minefield(x7,y7)==1
              count=count+1;
          end
      end
      if x8<row+1&&y8<col+1
          if minefield(x8,y8)==1
              count=count+1;
          end
      end
    minenum(i,j)=count;
    count=0;
    end
end


showfield=-ones(row,col);

%起始点
while(1)
    x=round(row/2*rand()+row/4);
    y=round(col/2*rand()+col/4);
    if(minefield(x,y)==1)
        continue;
    end
    break;
end

showfield=shownum(x,y,minefield,minenum,showfield,row,col);
flag=1;
% showing=(showfield+2)*30;
set(imh,'cdata',showfield);
drawnow
pause(0.5)
%Solving solution
%-2=已标记的雷
%-1=未掀开区域
%0=空白
%1-8=周围雷数
while (flag)
%Calculate the total known mines
knownmine=knownmines(row,col,showfield);
%Calculate the total unknown spaces
%unknown=unknowns(row,col,showfield)
%Do the simple solving progress 
counting=0;
%判断是否清理完的条件flag
for x=1:row
    for y=1:col
        if showfield(x,y)==-2
            counting=counting+1;
        end
    end
end
restmine=num-counting;
if counting==num
    flag=0;
    asuccess=asuccess+1;
    break;
end
counting=0;
for x=1:row
    for y=1:col
        if showfield(x,y)==-2||showfield(x,y)==-1
            counting=counting+1;
        end
    end
end

if counting==num
    flag=0;
    asuccess=asuccess+1;
    break;
end

m=1;
counting=0;
unknown=zeros(row,col);
xsector=zeros(3*max(row,col),1);
ysector=zeros(3*max(row,col),1);
for x=1:row
    for y=1:col
        if showfield(x,y)==0||showfield(x,y)==-1||showfield(x,y)==-2
            continue
        end
        for i=x-1:x+1
            for j=y-1:y+1
                if i==0 || i==row+1 || j==0 || j==col+1
                    continue
                end
                if showfield(i,j)==-1
                    xsector(m)=i;
                    ysector(m)=j;
                    m=m+1;
                    counting=counting+1;
                end
            end
        end
        unknown(x,y)=counting;
        if showfield(x,y)~=unknown(x,y)+knownmine(x,y)
            m=m-counting;
            counting=0;
            continue
        end
        counting=0;
    end
end
%判断失败条件
if m~=1
m;
%立flag
for k=1:m-1
    showfield(xsector(k),ysector(k))=-2;
    restmine=restmine-1;
end
knownmine=knownmines(row,col,showfield);

%点击工作

for x=1:row
    for y=1:col
        if showfield(x,y)==0||showfield(x,y)==-1||showfield(x,y)==-2||showfield(x,y)~=knownmine(x,y)
            continue
        end
            for i=x-1:x+1
                for j=y-1:y+1
                    if i==0 || i==row+1 || j==0 || j==col+1||showfield(i,j)~=-1
                        continue
                    end
                    showfield=shownum(i,j,minefield,minenum,showfield,row,col);
%                     showing=(showfield+2)*30;
                    set(imh,'cdata',showfield);
                    drawnow
                    pause(0.5)
                end
            end
    end
end

continue;
end %186 if m~=1

%对0周围的所有数字进行判断
for x=1:row
    for y=1:col
        Instruct=0;
        if showfield(x,y)~=-1
            continue
        end
            for i=x-1:x+1
                for j=y-1:y+1
                    if i==0 || i==row+1 || j==0 || j==col+1||showfield(i,j)~=0
                        continue;
                    end
                    Instruct=1;
                    break;
                end
                if Instruct==1
                    break;
                end
            end
        if Instruct==1
            showfield=shownum(x,y,minefield,minenum,showfield,row,col);
        end
    end
end

%对应坐标
for x=1:row
    for y=1:col
        index(x,y)=(x-1)*col+y;
    end
end

for x=1:row
    for y=1:col
        if showfield(x,y)==0||showfield(x,y)==-1||showfield(x,y)==-2
            continue
        end
        n=n+1;
    end
end
%构建A矩阵。列出所有可能线性方程组
A=zeros(n+1,col*row);
B=zeros(n+1,1);
for k=1:col*row
    A(1,k)=k;
end

n=2;
counting=0;
for x=1:row
    for y=1:col
        if showfield(x,y)==0||showfield(x,y)==-1||showfield(x,y)==-2
            continue
        end
            for i=x-1:x+1
                for j=y-1:y+1
                    if i==0 || i==row+1 || j==0 || j==col+1||showfield(i,j)~=-1
                        continue
                    end
                    counting=counting+1;
                    A(n,index(i,j))=1;
                end
            end
            if counting==0
                continue;
            end
            B(n)=showfield(x,y)-knownmine(x,y);
            n=n+1;
            counting=0;
    end
end
%失败条件
if n==2
    afailure=afailure+1;
    break;
end
A=A(1:n-1,:);
B=B(1:n-1,:);
si=1;
k=1;
while si>=k
    if A(2:end,k)==zeros(n-2,1)
        A(:,k)=[];
        k=k-1;
    end
    si=size(A,2);
    k=k+1;
end
kk=1;
%si 太大 随机选个点试试

if si>=20
    counting=1;
    G=zeros(row*col,2);
    for x=1:row
        for y=1:col
            if showfield(x,y)==-1
                G(counting,1)=x;
                G(counting,2)=y;
                counting=counting+1;
            end
        end
    end
    kk=0;
    G=G(1:counting-1,:);
end

if kk==1        
j=1;
%产生 si个0 1的排列组合的列向量 n会比矩阵的行数多1
C=zeros(1,si);
Possible=zeros(n-2,si);
x=1;
%{
while j<=si
    for k=1:j
        C(k)=1;
    end
    Possib=perms(C);
    l=size(Possib,1);
    for i=1:l
        if A*possib(i,:)'==B
            Possible(x,:)=possib(i,:);
            x=x+1;
        end
    end
    j=j+1
end
%}
m2=2^si;
A1=A(2:end,:);
B1=B(2:end,:);
for i=1:m2
    m1=2^(si-1);
    temp=i-1;
    for k=1:si
        C(k)=floor(temp/m1);
        temp=rem(temp,m1);
        m1=floor(m1/2);
    end
    if A1*C'==B1
        Possible(x,:)=C;
        x=x+1;
    end
end
Possible;
n=size(Possible,1);
for k=n:-1:1
    if Possible(n-k+1:end,:)==zeros(k,si)
        Possible(n+1-k:end,:)=[];
        break;
    end
end
k;%有k个是空
%失败条件
if k==n
    afailure=afailure+1;
    break;
end
x=1;
D=zeros(si,1);
for l=1:si
    D(l)=sum(Possible(:,l));
end

prob=min(D)/n;
counting=0;
knownnum=zeros(row,col);
G=zeros(row*col,2);
amount=0;
count1=0;
for x=1:row
    for y=1:col
        if showfield(x,y) ~=-1
            continue;
        end
        counting=counting+1;
        G(counting,1)=x;
        G(counting,2)=y;
        
    end
end
G=G(1:counting,:);
counting;
if prob<=(restmine/counting)
E=find(D==min(D));
l=size(E,1);
G=zeros(l,2);
F=zeros(1,l);
for k=1:l
    F(k)=A(1,E(k));
    if rem(F(k),col)==0
        G(k,1)=F(k)/col;
        G(k,2)=col;
        continue;
    end
    G(k,1)=floor(F(k)/col)+1;
    G(k,2)=rem(F(k),col);
end
end
end %if kk==1
l=size(G,1);
r=floor(rem(rand()*10000,l))+1;
if minefield(G(r,1),G(r,2))==1
    G(r,1);
    G(r,2);
    afailure=afailure+1;
    %disp('猜测失败')
    break;
end
showfield=shownum(G(r,1),G(r,2),minefield,minenum,showfield,row,col);
knowmine=knownmines(row,col,showfield);
% showing=(showfield+2)*30;
set(imh,'cdata',showfield);
drawnow
pause(0.5)
end
% end
%         end
%     end
% end
