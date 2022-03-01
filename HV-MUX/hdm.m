% 1. Install the Matlab Add-on: 'MATLAB Support Package for Arduino
% Hardware'.
% 2. Make sure that the Data Acquisition Toolbox is installed.
% 3. Connect the HV-MUX Arduino and the MCC USB-1604 to the PC.

initMux('COM12')                % (port)        'COMx = Arduino serial port'

% EXAMPLES:

enMux(1,1);                    % enable mux (row, col), 0=OFF, 1=ON
setMux(1,1);                   % set address (row, col), valid address range: 0..31
vSetDaq([100 100]);            % set HV-output voltages, ([V V])
vRampDaq([100 100]);           % set and ramp HV-output voltages, ([V V])       
[Vrow, Vcol] = vGetDaq();      % read the DAQ ADC values in Volts
[Vrow, Vcol] = vGetAvgDaq();   % read the average DAQ ADC values in Volts



