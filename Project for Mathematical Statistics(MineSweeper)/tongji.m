data=xlsread("data.xlsx",2,'B2:C42');
length=data(:,1);
success=data(:,2);
tb=table(length,success,'VariableNames',{'length','success'});
model=fitlm(tb,'success~length')
%plot(model)

X=length;
Y=success;
P=polyfit(X,Y,3);
Y1=polyval(P,X);
plot(X,Y,'b:o',X,Y1,'r-p');

Ym=mean(Y);
SSR=sum((Y1-Ym).^2);
SST=sum((Y-Ym).^2);
R=SSR/SST

data=xlsread("data.xlsx",3,'B2:F42');
length=data(:,1);
success=data(:,2);
tb=table(length,success,'VariableNames',{'length','success'});
model=fitlm(tb,'success~length')
plot(model)

data=xlsread("data.xlsx",7,'A2:J211');
Success=data(:,4);
Density=data(:,7);
Space=data(:,8);
Lengthratio=data(:,9);
tb=table(Success,Density,Space,Lengthratio,'VariableNames'...
,{'Success','Density','Space','Lengthratio'});
model=fitlm(tb,'Success~Density+Space+Lengthratio')

res=model.Residuals(:,1);
res=table2array(res);
subplot(1,2,1)
histogram(res,'Normalization','probability')
mu=mean(res);
variance=var(res);
x=-350:5:350;
y=normpdf(x,mu,variance);
subplot(1,2,2)
plot(x,y)
corr=corrcoef(model.CoefficientCovariance)
