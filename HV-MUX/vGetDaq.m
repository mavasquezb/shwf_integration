function [ch0, ch1] = vGetDaq()
% read DAQ ADC input voltage(s)
    
    global dq vScaleAdc0 vScaleAdc1;
    
    data = read(dq, 1); % single read
    ch0 = data.(1) * vScaleAdc0;
    ch1 = data.(2) * vScaleAdc1;
end

