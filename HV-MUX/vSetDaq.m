function result = vSetDaq(x)
% set DAC output voltage adc0, adc1

    arguments
        x (1,2) {mustBeNumeric}
    end
    
    global dq vScaleDac0 vScaleDac1 buffDac0 buffDac1;
    
    write(dq, [x(1)/vScaleDac0 x(2)/vScaleDac1]); % single write
    buffDac0(end) = x(1)/vScaleDac0; %fill last element of buffers with current value to align with ramp and avg read function.
    buffDac1(end) = x(2)/vScaleDac1;
    assignin('base','currDacVal', [buffDac0(end)*vScaleDac0 buffDac1(end)*vScaleDac0]); % return actual value to the workspace.
    result = 1;
end