% StaticDI.m
%
% Example Category:
%    DIO
% Matlab(2010 or 2010 above)
%
% Description:
%    This example demonstrates how to use Static DI function.
%
% Instructions for Running:
%    1. Set the 'deviceDescription' for opening the device. 
%    2. Set the 'startPort' as the first port for Di scanning.
%    3. Set the 'portCount' to decide how many sequential ports to 
%       operate Di scanning.
%
% I/O Connections Overview:
%    Please refer to your hardware reference manual.

function Project3_StaticDI(hObject)

% Make Automation.BDaq assembly visible to MATLAB.
BDaq = NET.addAssembly('Automation.BDaq');

% Configure the following three parameters before running the demo.
% The default device of project is demo device, users can choose other 
% devices according to their needs. 
deviceDescription = 'USB-4704,BID#0';
startPort = int32(0);
portCount = int32(1);
errorCode = Automation.BDaq.ErrorCode.Success;

% Step 1: Create a 'InstantDiCtrl' for DI function.
% and initialize from guidata.
instantDiCtrl = Automation.BDaq.InstantDiCtrl();

handles = guidata(hObject);

try
    % Step 2: Select a device by device number or device description and 
    % specify the access mode. In this example we use 
    % ModeWrite(default) mode so that we can fully control the 
    % device, including configuring, sampling, etc.
    instantDiCtrl.SelectedDevice = Automation.BDaq.DeviceInformation(...
        deviceDescription);
    
    % Step 3: read DI ports' status and show.
    buffer = NET.createArray('System.Byte', int32(64));
    t = timer('TimerFcn', {@TimerCallback, instantDiCtrl, startPort, ...
        portCount, buffer, hObject}, 'period', 1, 'executionmode', 'fixedrate', ...
        'StartDelay', 1);
    start(t);
     fprintf('Reading ports'' status is in progress...');
%     input('Press Enter key to quit!', 's');    
%     stop(t);
%     delete(t);
    
    uiwait(handles.figure1);

catch e
    % Something is wrong. 
    if BioFailed(errorCode)    
        errStr = 'Some error occurred. And the last error code is ' ... 
            + errorCode.ToString();
    else
        errStr = e.message;
    end
    disp(errStr);
end   

% Step 4: Close device and release any allocated resource.
instantDiCtrl.Dispose();

end

function result = BioFailed(errorCode)

result =  errorCode < Automation.BDaq.ErrorCode.Success && ...
    errorCode >= Automation.BDaq.ErrorCode.ErrorHandleNotValid;

end

function TimerCallback(obj, event, instantDiCtrl, startPort, ...
    portCount, buffer, hObject)
% Initialize from guidata.
handles = guidata(hObject);

Enable_DI = 0;
Amplitude_DI = 0;
Freqency_DI = 0;


errorCode = instantDiCtrl.Read(startPort, portCount, buffer); 
if BioFailed(errorCode)
    throw Exception();
end
temp = zeros(4,1);
for i=0:(portCount - 1)
    temp(i) = buffer.Get(i);
    fprintf('\nDI port %d status : 0x%X', startPort + i, ...
       temp(i));
end

buffer;

% upload guidata
handles.Enable_DI = Enable_DI;
handles.Amplitude.DI = Amplitude.DI;
handles.Freqency_DI = 0;
guidata(hObject,handles);
end






















