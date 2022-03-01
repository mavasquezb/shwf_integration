% Measurement Computing Hardware Limitations
% - Only two ADC input channels are currently supported for MCC USB-1604
% - For your Measurement Computing™ device to appear in the output of the daqlist function, you must first detect it in InstaCal.
% - MCC devices are not supported by the Simulink® blocks of the Data Acquisition Toolbox™ block library.
% - External clocking and triggering of MCC devices is not supported.
% - Support for MCC devices is limited to analog output voltage and analog input voltage measurements.
% - MCC DEMO-BOARD devices simulated in InstaCal are not supported.
%
% Analog input supports:
%   3 ranges supported
%   Rates from 0.1 to 1330000.0 scans/sec
%   4 channels ('Ai0','Ai1','Ai2','Ai3')
%   'Voltage' measurement type
%    
% Index    Type     Device     Channel      Measurement Type             Range               Name    
% _____    ____    ________    _______    _____________________    __________________    ____________
%
%   1      "ai"    "Board0"     "Ai0"     "Voltage (Diff)"         "-10 to +10 Volts"    "Board0_Ai0"
%   2      "ai"    "Board0"     "Ai1"     "Voltage (Diff)"         "-10 to +10 Volts"    "Board0_Ai1"
%   3      "ai"    "Board0"     "Ai2"     "Voltage (SingleEnd)"    "-10 to +10 Volts"    "Board0_Ai2"
%   4      "ai"    "Board0"     "Ai3"     "Voltage (SingleEnd)"    "-10 to +10 Volts"    "Board0_Ai3"
%
%
% Analog output supports:
%   -10 to +10 Volts range
%   Rates from 1.0 to 1000000.0 scans/sec
%   2 channels ('Ao0','Ao1')
%   'Voltage' measurement type

function initMux(arduinoCOM);
% INIT HV MUX. Connect the MCC USB-1604 and Arduino first.
    global ardu dq;
    global ledPin rowEnPin colEnPin row1Pin row2Pin row3Pin row4Pin row5Pin col1Pin col2Pin col3Pin col4Pin col5Pin;
    global vScaleDac0 vScaleDac1 vScaleAdc0 vScaleAdc1 buffDac0 buffDac1 nSampl; 
    
    % Connect the Arduino for MUX control
    ardu = arduino(arduinoCOM, 'Mega2560')
    ledPin = 'D13';
    rowEnPin = 'D52';
    colEnPin = 'D53';
    row1Pin = 'D42';
    row2Pin = 'D44';
    row3Pin = 'D46';
    row4Pin = 'D48';
    row5Pin = 'D50';
    col1Pin = 'D43';
    col2Pin = 'D45';
    col3Pin = 'D47';
    col4Pin = 'D49';
    col5Pin = 'D51';
           
    % Init Arduino & MUX
    writeDigitalPin(ardu, ledPin, 0);
    writeDigitalPin(ardu, rowEnPin, 0);
    writeDigitalPin(ardu, colEnPin, 0);
    assignin('base','addrMux', [0 0])

    vScaleDac0 = 100.0; % scaling factor
    vScaleDac1 = 100.0;
    vScaleAdc0 = 100.0;
    vScaleAdc1 = 100.0;
    rate = 1000;
    tRamp = 1; %ramping period in s.
    nSampl = tRamp * rate;
    %nSampl = 512; % Averaging buffer. Take the minimum value for now (fastes ramp).
    
    % Connect the MCC DAQ
    dq = daq("mcc")
    dq(1, :)

    dq.Rate = rate;
    addinput(dq, "Board0", "Ai0", "Voltage");
    addinput(dq, "Board0", "Ai1", "Voltage");
    %addinput(dq, "Board0", "Ai2", "Voltage"); %currently not supported
    %addinput(dq, "Board0", "Ai3", "Voltage"); %currently not supported
    addoutput(dq, "Board0", "Ao0", "Voltage");
    addoutput(dq, "Board0", "Ao1", "Voltage");


    buffDac0 = linspace(0, 0, nSampl); % output buffers for ramping and avg read/write.
    buffDac1 = linspace(0, 0, nSampl);

    write(dq, [buffDac0(end) buffDac1(end)]); % Single write, outputs zero.
    assignin('base','currDacVal', [buffDac0(end)*vScaleDac0 buffDac1(end)*vScaleDac0]); % return actual value to the workspace. 
end



