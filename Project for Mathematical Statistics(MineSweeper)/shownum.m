function [y]=shownum(i,j,minefield,minenum,showfield,row,col)
if i==0 || i==row+1 || j==0 || j==col+1 || minefield(i,j)==1||showfield(i,j)~=-1
    y=showfield;
    return;
end
if minefield(i,j)==0
    if minenum(i,j)~=0
        showfield(i,j)=minenum(i,j);
        y=showfield;
    else
        showfield(i,j)=0;
        showfield=shownum(i-1,j,minefield,minenum,showfield,row,col);
        showfield=shownum(i,j+1,minefield,minenum,showfield,row,col);
        showfield=shownum(i+1,j,minefield,minenum,showfield,row,col);
        showfield=shownum(i,j-1,minefield,minenum,showfield,row,col);
        y=showfield;
    end
end

