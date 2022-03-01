function [ch0, ch1] = vGetAvgDaq()
% read average DAQ ADC input voltage(s)
    
    global dq nSampl vScaleAdc0 vScaleAdc1 buffDac0 buffDac1;

    dummy0_out = linspace(buffDac0(end), buffDac0(end), nSampl); % fill dummy buffers with last dac value for fake write, to read.
    dummy1_out = linspace(buffDac1(end), buffDac1(end), nSampl);
    [avg, startTime] = readwrite(dq, [dummy0_out' dummy1_out']); % simultaneous read/write operation
    ch0 = mean(avg.(1)) * vScaleAdc0;
    ch1 = mean(avg.(2)) * vScaleAdc1;
end








