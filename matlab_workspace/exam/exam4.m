function varargout = exam4(varargin)
% EXAM4 MATLAB code for exam4.fig
%      EXAM4, by itself, creates a new EXAM4 or raises the existing
%      singleton*.
%
%      H = EXAM4 returns the handle to a new EXAM4 or the handle to
%      the existing singleton*.
%
%      EXAM4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXAM4.M with the given input arguments.
%
%      EXAM4('Property','Value',...) creates a new EXAM4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before exam4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to exam4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help exam4

% Last Modified by GUIDE v2.5 07-Jan-2024 17:44:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @exam4_OpeningFcn, ...
                   'gui_OutputFcn',  @exam4_OutputFcn, ...
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


% --- Executes just before exam4 is made visible.
function exam4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to exam4 (see VARARGIN)

% Choose default command line output for exam4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes exam4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes(handles.axes1);
title('Function Graphs')
grid on;

% --- Outputs from this function are returned to the command line.
function varargout = exam4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
fmenu=findobj(gcbf, 'Tag','listbox1');
fsec=get(fmenu,'Value');
if fsec==2
    Linear;
end
if fsec==3
    Nyquist;
end
if fsec==4
    Sine;
end
if fsec==5
    StepResp;
end

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in plot.
function plot_Callback(hObject, eventdata, handles)
% hObject    handle to plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x f 

listbox=findobj(gcbf,'Tag','listbox1');

fsel=get(listbox,'Value');

axesH=handles.axes1;

if fsel==2
    axes(axesH)
    step(x,f);
    title('Linear Plot Diagram','FontSize',6,'FontWeight',"bold");
    grid on;
end

if fsel==3
  axes(axesH)
  nyquist(x,f);
  title('Nyquist Plot Diagram',"FontSize",6,"FontWeight","bold")
  grid on;
end

if fsel==4
    axes(axesH)
    step(x,f);
    title('Sine Plot Diagram','FontSize',6,'FontWeight',"bold");
    grid on;
end

if fsel==5
    axes(axesH)
    step(x,f);
    title('StepResp Plot Diagram','FontSize',6,'FontWeight',"bold");
    grid on;
end

% --- Executes on button press in print.
function print_Callback(hObject, eventdata, handles)
% hObject    handle to print (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg;

% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;

% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;

% --- Executes on button press in on.
function on_Callback(hObject, eventdata, handles)
% hObject    handle to on (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of on


% --- Executes on button press in off.
function off_Callback(hObject, eventdata, handles)
% hObject    handle to off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of off


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname,filterindex]=uiputfile( ...
    {'.*jpg','JPG Image (.*jpg)';'.bmp','Windows Bitmap (.*bmp)'; '*.*','All Files (*.*)'} ...
    ,'Save As');
f=getframe(handle.axes1);
[x f]=frame2im(f);
imwrite(x,filename);