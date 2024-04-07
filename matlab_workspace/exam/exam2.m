function varargout = finalsoru1(varargin)
% FINALSORU1 MATLAB code for finalsoru1.fig
%      FINALSORU1, by itself, creates a new FINALSORU1 or raises the existing
%      singleton*.
%
%      H = FINALSORU1 returns the handle to a new FINALSORU1 or the handle to
%      the existing singleton*.
%
%      FINALSORU1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINALSORU1.M with the given input arguments.
%
%      FINALSORU1('Property','Value',...) creates a new FINALSORU1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before finalsoru1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to finalsoru1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help finalsoru1

% Last Modified by GUIDE v2.5 07-Jan-2024 14:02:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @finalsoru1_OpeningFcn, ...
                   'gui_OutputFcn',  @finalsoru1_OutputFcn, ...
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


% --- Executes just before finalsoru1 is made visible.
function finalsoru1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to finalsoru1 (see VARARGIN)

% Choose default command line output for finalsoru1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes finalsoru1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes(handles.axes1);
title('Bode Diagram');

% --- Outputs from this function are returned to the command line.
function varargout = finalsoru1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in plot.
function plot_Callback(hObject, eventdata, handles)
% hObject    handle to plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c s 

num=str2num(get(handles.num,'String'));
den=str2num(get(handles.den,'String'));
iv=str2num(get(handles.iv,'String'));
fv=str2num(get(handles.fv,'String'));
ns=str2num(get(handles.ns,'String'));

w=logspace(iv,fv,ns);

index1=get(handles.radiobutton_off,'Value');
index2=get(handles.radiobutton_on,'Value');

style=get(handles.popupmenu1,'Value');
color=get(handles.popupmenu2,'Value');

if style==2
    s='--';
elseif style==3
    s='*';
elseif style==4
    s='-*';
elseif style==5
    s='s';
else
    s='-';
end

if color==2
    c='r';
elseif color==3
    c='g';
elseif color==4
    c='b';
elseif color==5
    c='y';
elseif style==6
    c='m';
elseif style==7
    c='k';
else
    c='b';
end

sys=tf(num,den);
bode(handles.axes1,sys,w,s,c);


if index1==1
    grid(handles.axes1,"Off");
elseif index2==1
    grid(handles.axes1,"On");
end
title('Bode Diagram');

% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close; 

% --- Executes on button press in hold.
function hold_Callback(hObject, eventdata, handles)
% hObject    handle to hold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hold on;

% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;

% --- Executes on button press in print.
function print_Callback(hObject, eventdata, handles)
% hObject    handle to print (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg;

% --- Executes on button press in radiobutton_off.
function radiobutton_off_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_off

set(get(handles.radiobutton_off,'Value'),1);
set(get(handles.radiobutton_on,'Value'),0);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function iv_Callback(hObject, eventdata, handles)
% hObject    handle to iv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iv as text
%        str2double(get(hObject,'String')) returns contents of iv as a double


% --- Executes during object creation, after setting all properties.
function iv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fv_Callback(hObject, eventdata, handles)
% hObject    handle to fv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fv as text
%        str2double(get(hObject,'String')) returns contents of fv as a double


% --- Executes during object creation, after setting all properties.
function fv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ns_Callback(hObject, eventdata, handles)
% hObject    handle to ns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ns as text
%        str2double(get(hObject,'String')) returns contents of ns as a double


% --- Executes during object creation, after setting all properties.
function ns_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function num_Callback(hObject, eventdata, handles)
% hObject    handle to num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num as text
%        str2double(get(hObject,'String')) returns contents of num as a double


% --- Executes during object creation, after setting all properties.
function num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function den_Callback(hObject, eventdata, handles)
% hObject    handle to den (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of den as text
%        str2double(get(hObject,'String')) returns contents of den as a double


% --- Executes during object creation, after setting all properties.
function den_CreateFcn(hObject, eventdata, handles)
% hObject    handle to den (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton_on.
function radiobutton_on_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_on (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_on

set(get(handles.radiobutton_on,'Value'),1);
set(get(handles.radiobutton_off,'Value'),0);
