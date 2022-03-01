function result = enMux(x)
% Enable, disable row, column sections (0 or 1)
    arguments
        x (1,2) {mustBeNumericOrLogical, mustBeNonnegative}
    end

    global ardu;
    global ledPin rowEnPin colEnPin row1Pin row2Pin row3Pin row4Pin row5Pin col1Pin col2Pin col3Pin col4Pin col5Pin;
    
    if (x(1) == 1) && (x(2) == 1)
        writeDigitalPin(ardu, rowEnPin, 1);        
        writeDigitalPin(ardu, colEnPin, 1);
        writeDigitalPin(ardu, ledPin, 1);
        result = 1;
    elseif x(1) == 1
        writeDigitalPin(ardu, rowEnPin, 1);
        writeDigitalPin(ardu, ledPin, 1);
        result = 1;
    elseif x(2) == 1
        writeDigitalPin(ardu, colEnPin, 1);
        writeDigitalPin(ardu, ledPin, 1);
        result = 1;
    elseif (x(1) == 0) && (x(2) == 0)
        writeDigitalPin(ardu, rowEnPin, 0);        
        writeDigitalPin(ardu, colEnPin, 0);
        writeDigitalPin(ardu, ledPin, 0);
        result = 1;
    elseif x(1) == 0
        writeDigitalPin(ardu, rowEnPin, 0);
        result = 1;
    elseif x(2) == 0
        writeDigitalPin(ardu, colEnPin, 0);
        result = 1;
    else
        result = 0;
    end
    
    assignin('base','muxEnableStatus', x);    
end