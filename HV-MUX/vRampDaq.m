function result = vRampDaq(x)
% set DAC output voltage adc0, adc1

    arguments
        x (1,2) {mustBeNumeric}
    end
    
    global dq nSampl vScaleDac0 vScaleDac1 buffDac0 buffDac1;
    
    buffDac0 = linspace(buffDac0(end), x(1)/vScaleDac0, nSampl);
    buffDac1 = linspace(buffDac1(end), x(2)/vScaleDac1, nSampl);
    
    [data, startTime] = readwrite(dq, [buffDac0' buffDac1']); %simultaneous read/write.
    assignin('base','currDacVal', [buffDac0(end)*vScaleDac0 buffDac1(end)*vScaleDac0]); % return actual value to the workspace. 
    result = 1;
end
