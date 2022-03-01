function result = setMux(x)
% Address and switch MUX ([row col])
    arguments
        x (1,2) {mustBeNumeric, mustBeNonnegative}
    end

    global ardu;
    global row1Pin row2Pin row3Pin row4Pin row5Pin col1Pin col2Pin col3Pin col4Pin col5Pin;
    
    writeDigitalPin(ardu, row1Pin, bitget(x(1), 1));
    writeDigitalPin(ardu, row2Pin, bitget(x(1), 2));
    writeDigitalPin(ardu, row3Pin, bitget(x(1), 3));
    writeDigitalPin(ardu, row4Pin, bitget(x(1), 4));
    writeDigitalPin(ardu, row5Pin, bitget(x(1), 5));

    writeDigitalPin(ardu, col1Pin, bitget(x(2), 1));
    writeDigitalPin(ardu, col2Pin, bitget(x(2), 2));
    writeDigitalPin(ardu, col3Pin, bitget(x(2), 3));
    writeDigitalPin(ardu, col4Pin, bitget(x(2), 4));
    writeDigitalPin(ardu, col5Pin, bitget(x(2), 5));
  
    assignin('base','currentMuxAddress', x);
    result = 1;
end
