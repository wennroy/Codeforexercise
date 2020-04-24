clf
clear all
clc


%Build the GUI
plotbutton=uicontrol('style','pushbutton',...
   'string','Run', ...
   'fontsize',12, ...
   'position',[100,400,50,20], ...
   'callback', 'run=1;');

%define the stop button
erasebutton=uicontrol('style','pushbutton',...
   'string','Stop', ...
   'fontsize',12, ...
   'position',[200,400,50,20], ...
   'callback','freeze=1;');

%define the Quit button
quitbutton=uicontrol('style','pushbutton',...
   'string','Quit', ...
   'fontsize',12, ...
   'position',[300,400,50,20], ...
   'callback','stop=1;close;');
number = uicontrol('style','text', ...
    'string','1', ...
   'fontsize',12, ...   
   'position',[20,400,50,20]);
fruitnumber = uicontrol('style','text', ...
    'string','1', ...
   'fontsize',12, ...
   'position',[400,400,50,20]);
stop= 0; %wait for a quit button push
run = 0; %wait for a draw 
freeze = 0; %wait for a freeze


%Main Progress
n=64;
z=zeros(n,n);
cells=z;
cells(:,[1,end])=3;
cells([1,end],:)=3;
ocells=cells;
imh = image(cells,'CDataMapping','scaled');
text(500,400,'贪吃蛇')
set(imh, 'erasemode', 'none')
axis equal
axis tight

x=zeros(1,(n-2)^2);
y=zeros(1,(n-2)^2);
%初始化贪吃蛇位置
x(1)=32;y(1)=32;
x(2)=33;y(2)=32;
len=2;
Fruit=0;
samething=0;
fruitsum=0;
dd=1; %Default Direction 1=left 2=up 3=right 4=down
%墙壁是3，贪吃蛇是1，水果是2
while (stop==0)
    
    tic %计算时间
    if(run==1)
    %还有没有水果
        if (Fruit~=1)
            while (samething~=1)
            xr=unidrnd(n-2)+1;
            yr=unidrnd(n-2)+1;
            samething=0;
                for m=1:len
                    if(x(m)==xr || y(m)==yr)
                        samething=1;
                        break;
                    end
                end
            end
            Fruit=1;
        end
        
        %吃水果
        if(xr==x(1)&&yr==y(1))
            fruitsum=fruitsum+1;
            Fruit=0;
            samething=0;
            len=len+1;
        end

        %判断向哪里走
        keyb=get(gcf,'CurrentCharacter')
        switch(keyb)
            case 'a'
                if(dd~=4)
                    dd=2;
                end
            case 'w'
                if(dd~=3)
                    dd=1;
                end
            case 'd'
                if(dd~=2)
                    dd=4;
                end
            case 's'
                if(dd~=1)
                    dd=3;
                end
        end
        
        
        %跟上上一个单元
        for m=len:-1:2
            x(m)=x(m-1);
            y(m)=y(m-1);
        end
        
        switch (dd)
            case 1
                x(1)=x(1)-1;
            case 2
                y(1)=y(1)-1;
            case 3
                x(1)=x(1)+1;
            case 4
                y(1)=y(1)+1;
        end
        %Draw the graph (Cells)
        cells=zeros(n,n);
        cells(xr,yr)=2;
        for m=1:len
            cells(x(m),y(m))=1;
        end
        cells(:,[1,end])=3;
        cells([1,end],:)=3;
                %碰撞条件
        if(cells(x(1),y(1))==3)
            freeze=1;
            fpintf("Game Over!");
        end
        for m=2:len
            if (x(1)==x(m) && y(1)==y(m))
                 freeze=1;
                 fpintf("Game Over!");
            end
        end
        %循环时间
        while (toc<=.08)
        end
        
        set(imh,'cdata',cells)
        stepnumber = 1 + str2double(get(number,'string'));
        set(number,'string',num2str(stepnumber))
        set(fruitnumber,'string',num2str(fruitsum))
    end
        if(freeze==1)
            run=0;
            freeze=0;
        end
    %draw the new image
    drawnow
end

