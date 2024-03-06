clc
clear all
clc
format shortG;
T1=xlsread("COALINDIA.NS.csv");
T2=xlsread("ITC.NS.csv");
T3=xlsread("^NSEI.csv");
cp_coal=T1(:,4);
cp_itc=T2(:,4);
cp_nifty=T3(:,4);
n1=size(cp_coal,1);
n2=size(cp_itc,1);
n3=size(cp_nifty,1);

for i=1:n1-1
   rt_coal(i,1)= (cp_coal(i+1)-cp_coal(i))/cp_coal(i);
end
rt_coal
for i=1:n2-1
   rt_itc(i,1)= (cp_itc(i+1)-cp_itc(i))/cp_itc(i);
end
rt_itc
for i=1:n3-1
   rt_nifty(i,1)= (cp_nifty(i+1)-cp_nifty(i))/cp_nifty(i);
end
rt_nifty

m1=mean(rt_coal)
m2=mean(rt_itc)
m3=mean(rt_nifty);
size(rt_coal)
size(rt_nifty)
size(rt_itc)

coal_nifty=cov(rt_coal,rt_nifty);
itc_nifty=cov(rt_itc,rt_nifty);
A=cov(rt_coal,rt_itc);

w1=0:0.05:1
w2=1-w1
 for i=1:20
    mui(i,1)=w1(i)*m1+w2(i)*m2;
 end
 mui
 for i=1:20
    sig_squ(i,1)=w1(i)^2*A(1,1)+ w2(i)^2*A(2,2)+2*w1(i)*w2(i)*A(1,2);
 end

plot(sig_squ, mui)
u=ones(1,2);
wmin1=u*inv(A)/(u*inv(A)*u')
beta_coal=coal_nifty(1,2)/coal_nifty(2,2);
beta_itc=itc_nifty(1,2)/coal_nifty(2,2);

