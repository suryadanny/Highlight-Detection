function varargout = applausedetection(varargin)
% APPLAUSEEXP MATLAB code for applauseexp.fig
%      APPLAUSEEXP, by itself, creates a new APPLAUSEEXP or raises the existing
%      singleton*.
%
%      H = APPLAUSEEXP returns the handle to a new APPLAUSEEXP or the handle to
%      the existing singleton*.
%
%      APPLAUSEEXP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPLAUSEEXP.M with the given input arguments.
%
%      APPLAUSEEXP('Property','Value',...) creates a new APPLAUSEEXP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before applauseexp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to applauseexp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help applauseexp

% Last Modified by GUIDE v2.5 11-Sep-2016 20:33:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @applauseexp_OpeningFcn, ...
                   'gui_OutputFcn',  @applauseexp_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before applauseexp is made visible.
function applauseexp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to applauseexp (see VARARGIN)

% Choose default command line output for applauseexp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes applauseexp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = applauseexp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
[ip,fs]= audioread('b1(21).wav');
L=length(ip);
ip=ip';
ip1=ip(1,:);
t=1:L;
t1=1:184375;
ip2=Normalisation(ip1);
OB=blocking(ip2,1);
z=L/fs;
[e1,lom,v]=process(OB,z);
subplot(4,1,1);
plot(t,ip1);
xlabel('time');
ylabel('audio signal');

subplot(4,1,2);
plot(t1,e1);
xlabel('no of frames');
ylabel('decay factor');

e2=e1(1,1:1000);
t2=1:1000;
subplot(4,1,3);
plot(t2,e2);
xlabel('no of frames');
ylabel('decay factor(1000)');

subplot(4,1,4);
plot(t1,lom);
xlabel('time');
ylabel('Min lag');





vidObj=VideoReader('b1.flv.MPG');
[audio,fs]=audioread('b1(21).WAV');
audio=audio(:,1);
framesPerSecond = get(vidObj,'FrameRate');
framesPerSecond=int16(framesPerSecond);
numFrames = get(vidObj,'NumberOfFrames');

rem=v;
rem=transpose(rem);
l=length(rem);
for i=3:l;
    if(rem(i,1)+1==rem(i+1))
        i=i+1;
    else
        
        
       
audio1=audio(fs*(rem(i,1)-3)+1 : fs*(rem(i,1)+6),1);
 video = read(vidObj,[1+framesPerSecond*(rem(i,1)-3) framesPerSecond*(rem(i,1)+6)]);
h = implay(video,30);

play(h.DataSource.Controls);

 sound(audio1,fs);
    end
end
