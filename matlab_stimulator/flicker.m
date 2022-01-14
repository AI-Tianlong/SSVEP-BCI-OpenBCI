function y=flicker(f,i,phi,ifi)
    freq = f;
    angfreq = 2*pi*freq;
    light=255*(1/2*(1+sin(angfreq*(i*ifi)+phi)));
    y=light;
end