%%%%%%%program for QAM generation and recepation %%%%%%%%%

clc
clear all
close all

f1=2; 


g=[00 01 10 11];
n=1;
t=0:0.001:1;

%%%%%%%%% genaration of carriers %%%%%%%%%
y1=2*sin(2*pi*f1*t);
y2=2*sin((2*pi*f1*t)+ 180/57.32);
y3=3*sin(2*pi*f1*t);
y4=3*sin((2*pi*f1*t)+ 180/57.32);

%%%%%%% array declaration %%%%%%%%%%%%
mod=[];
is=[];

%%%%%%%%%% this section perform PSK modulation %%%%%%
while n <= length(g)
    
    if g(n)==00
        p=0*ones(1,length(y2));
        y=y1;
    elseif g(n)==01
        p=1*ones(1,length(y2));
        y=y2;
        
    elseif g(n)==10
        y=y3;
        p=2*ones(1,length(y2));
    else
        y=y4;
		p=3*ones(1,length(y2));
    end 
    n=n+1;
    
    mod=[mod y];
    is=[is p];
    
end


%%%%%%% next program is for ploting QAM generated signals %%%%%%%%
subplot 212
plot(mod)
title('QAM Generation')
legend('QAM OUTPUT')
xlabel('Time')
ylabel('Amplitude')

subplot 211
plot(is)
title('INFORMATION SIGNAL')
legend('INPUT DATA')
xlabel('Time')
ylabel('Amplitude')