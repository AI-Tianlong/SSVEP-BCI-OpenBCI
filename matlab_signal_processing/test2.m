function [result]=test2(sig_after_detrend, fs, f0)

    %���ó�ֵ

    f0=f0;
    fs=fs;
    Ts=1/fs;
    NLen=512;

    n=0:NLen-1;

    %�ݲ��������

    apha=-2*cos(2*pi*f0*Ts);

    beta=0.96;

    b=[1 apha 1];

    a=[1 apha*beta beta^2];





    x=sig_after_detrend;%ԭ�ź�

    y=dlsim(b,a,x);%�ݲ����˲�����
    result=y;
end

    %���źŽ���Ƶ��任��

