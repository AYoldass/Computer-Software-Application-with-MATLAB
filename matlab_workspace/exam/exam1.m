function varargout = exam1(varargin)
% EXAM1 MATLAB code for exam1.fig
%      EXAM1, by itself, creates a new EXAM1 or raises the existing
%      singleton*.
%
%      H = EXAM1 returns the handle to a new EXAM1 or the handle to
%      the existing singleton*.
%
%      EXAM1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXAM1.M with the given input arguments.
%
%      EXAM1('Property','Value',...) creates a new EXAM1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before exam1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to exam1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help exam1

% Last Modified by GUIDE v2.5 06-Jan-2024 17:49:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @exam1_OpeningFcn, ...
                   'gui_OutputFcn',  @exam1_OutputFcn, ...
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


% --- Executes just before exam1 is made visible.
function exam1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to exam1 (see VARARGIN)

% Choose default command line output for exam1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes exam1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes(handles.axes1);
title('Bode Diagram');


% --- Outputs from this function are returned to the command line.
function varargout = exam1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c s
num = str2num(get(handles.num,'string'));
den = str2num(get(handles.den,'string'));
iv = str2num(get(handles.iv,'string'));
fv = str2num(get(handles.fv,'string'));
ne = str2num(get(handles.ne,'string'));

w=logspace(iv,fv,ne);

index1 = get(handles.radiobutton1,'Value');
index2 = get(handles.radiobutton2,'Value');

style=get(handles.popupmenu1,'Value');
color=get(handles.popupmenu2,'Value');
% style = get(handles.popupmenu1,'String');
% s = style{get(handles.popupmenu1,'value')};
% 
% color = get(handles.popupmenu2,'String');
% c = color{get(handles.popupmenu2,'value')};

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
bode(handles.axes1,sys,w,s);







% % % w = logspace(iv,fv,ne);
% % % h = freqs(num,den,w);
% % % dbh = 20*log(abs(h));
% % % phs = angle(h)*180/pi;


%use uipanel
% % % uip = uipanel('Position',[0.31 0.025 0.68 0.95]);
% % % ax1 =subplot(2,1,1,'Parent',uip);
% % % semilogx(ax1,w,dbh,'LineWidth',2.5);
% % % title('\bf Bode Diagram','fontsize',10);
% % % ylabel('\bf Magnitude(dB)','fontsize',10);
% % % ax2 =subplot(2,1,2,'Parent',uip);
% % % semilogx(ax2,w,phs,'LineWidth',2.5);
% % % xlabel('\bf Freq(rad/s)','fontsize',10);
% % % ylabel('\bf Phase(degrees)','fontsize',10);



%grafikler taşıyor
% % % axes(handles.axes1)
% % % subplot(211);
% % % semilogx(w,dbh,'LineWidth',2.5);
% % % title('\bf Bode Diagram','fontsize',10);
% % % ylabel('\bf Magnitude(dB)','fontsize',10);
% % % subplot(212);
% % % semilogx(w,phs,'LineWidth',2.5);
% % % xlabel('\bf Freq(rad/s)','fontsize',10);
% % % ylabel('\bf Phase(degrees)','fontsize',10);

    if index1 == 1
        grid(handles.axes1,'on')
       % grid(handles.axes3,'on')
    else if index2 == 1
            grid(handles.axes1,'off')
       %    grid(handles.axes3,'off')
    end
end
title('Bode Diagram');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
hold on;
axes(handles.axes1);
hold on;

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
cla;
axes(handles.axes1);
cla;

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg;

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton1,'Value',1);
set(handles.radiobutton2,'Value',0);

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',1);

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



function ne_Callback(hObject, eventdata, handles)
% hObject    handle to ne (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ne as text
%        str2double(get(hObject,'String')) returns contents of ne as a double


% --- Executes during object creation, after setting all properties.
function ne_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ne (see GCBO)
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
