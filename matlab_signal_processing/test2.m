function [result]=test2(sig_after_detrend, fs, f0)

    %设置初值

    f0=f0;
    fs=fs;
    Ts=1/fs;
    NLen=512;

    n=0:NLen-1;

    %陷波器的设计

    apha=-2*cos(2*pi*f0*Ts);

    beta=0.96;

    b=[1 apha 1];

    a=[1 apha*beta beta^2];





    x=sig_after_detrend;%原信号

    y=dlsim(b,a,x);%陷波器滤波处理
    result=y;
end

    %对信号进行频域变换。

