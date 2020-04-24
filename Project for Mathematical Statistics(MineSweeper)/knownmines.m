function [knownmine] = knownmines(row,col,showfield)
knownmine=zeros(row,col);
counting=0;
for x=2:row-1
    for y=2:col-1
        for i=x-1:x+1
            for j=y-1:y+1
                if showfield(i,j)==-2
                    counting=counting+1;
                end
            end
        end
        knownmine(x,y)=counting;
        counting=0;
    end
end
%teshu
for i=row-1:row
    for j=col-1:col
        if showfield(i,j)==-2
           counting=counting+1;
        end
    end
end
knownmine(row,col)=counting;
counting=0;
for i=row-1:row
    for j=1:2
        if showfield(i,j)==-2
           counting=counting+1;
        end
    end
end
knownmine(row,1)=counting;
counting=0;
for i=1:2
    for j=col-1:col
        if showfield(i,j)==-2
           counting=counting+1;
        end
    end
end
knownmine(1,col)=counting;
counting=0;
for i=1:2
    for j=1:2
        if showfield(i,j)==-2
           counting=counting+1;
        end
    end
end
knownmine(1,1)=counting;
counting=0;

for x=2:row-1
    for i=x-1:x+1
        for j=1:2
            if showfield(i,j)==-2
                counting=counting+1;
            end
        end
    end
    knownmine(x,1)=counting;
    counting=0;
end

for x=2:row-1
    for i=x-1:x+1
        for j=col-1:col
            if showfield(i,j)==-2
                counting=counting+1;
            end
        end
    end
    knownmine(x,1)=counting;
    counting=0;
end

for y=2:col-1
    for i=1:2
        for j=y-1:y+1
            if showfield(i,j)==-2
                counting=counting+1;
            end
        end
    end
    knownmine(1,y)=counting;
    counting=0;
end

for y=2:col-1
    for i=1:2
        for j=y-1:y+1
            if showfield(i,j)==-2
                counting=counting+1;
            end
        end
    end
    knownmine(row,y)=counting;
    counting=0;
end

end

