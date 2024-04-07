function varargout = exam3(varargin)
% EXAM3 MATLAB code for exam3.fig
%      EXAM3, by itself, creates a new EXAM3 or raises the existing
%      singleton*.
%
%      H = EXAM3 returns the handle to a new EXAM3 or the handle to
%      the existing singleton*.
%
%      EXAM3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXAM3.M with the given input arguments.
%
%      EXAM3('Property','Value',...) creates a new EXAM3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before exam3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to exam3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help exam3

% Last Modified by GUIDE v2.5 07-Jan-2024 15:07:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @exam3_OpeningFcn, ...
                   'gui_OutputFcn',  @exam3_OutputFcn, ...
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


% --- Executes just before exam3 is made visible.
function exam3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to exam3 (see VARARGIN)

% Choose default command line output for exam3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes exam3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% minv1=str2double(get(handles.min1,'string'));
% maxv1=str2double(get(handles.max1,'string'));
%  
% % w
% minv2=str2double(get(handles.min2,'string'));
% maxv2=str2double(get(handles.max2,'string'));
%  
% set(handles.slider1,'Min',minv1);
% set(handles.slider1,'Max',maxv1);
%  
%  
% set(handles.slider3,'Min',minv2);
% set(handles.slider3,'Max',maxv2);
% A = get(handles.slider1,'Value');
%  
% w = get(handles.slider2,'Value');
%  
% set(handles.ValueA,'string',num2str(A));
% set(handles.ValueFreq,'string',num2str(w));
%  
% t = eval(get(handles.t,'String'));
% f = A*sin(w*t);
%  
% axes(handles.axes1)
% plot(t,f)
% title('f(t)= Asin(\omega t)')
% xlabel('time(seconds)')
% ylabel('f(t)')
% 
% set(handles.on,'Value',0);
% set(handles.off,'Value',1);



% --- Outputs from this function are returned to the command line.
function varargout = exam3_OutputFcn(hObject, eventdata, handles) 
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
% A
minv1=str2double(get(handles.min1,'string'));
maxv1=str2double(get(handles.max1,'string'));
 
% w
minv2=str2double(get(handles.min2,'string'));
maxv2=str2double(get(handles.max2,'string'));
 
set(handles.slider1,'Min',minv1);
set(handles.slider1,'Max',maxv1);
 
 
set(handles.slider2,'Min',minv2);
set(handles.slider2,'Max',maxv2);
 
 
A = get(handles.slider1,'Value');
 
w = get(handles.slider2,'Value');
 
set(handles.ValueA,'string',num2str(A));
set(handles.ValueFreq,'string',num2str(w));
 
t = eval(get(handles.t,'String'));
f = A*sin(w*t);
 
axes(handles.axes1)
plot(t,f)
title('f(t)= Asin(\omega t)')
xlabel('time(seconds)')
ylabel('f(t)')
 
index1 = get(handles.on,'Value');
index2 = get(handles.off,'Value');
if index1 == 1
    grid(handles.axes1,'on')
else if index2 == 1
        grid(handles.axes1,'off')
    end
end



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

% --- Executes on button press in on.
function on_Callback(hObject, eventdata, handles)
% hObject    handle to on (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.on,'Value',1);
set(handles.off,'Value',0);
 

% Hint: get(hObject,'Value') returns toggle state of on


% --- Executes on button press in off.
function off_Callback(hObject, eventdata, handles)
% hObject    handle to off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.on,'Value',0);
set(handles.off,'Value',1);
% Hint: get(hObject,'Value') returns toggle state of off



function min1_Callback(hObject, eventdata, handles)
% hObject    handle to min1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min1 as text
%        str2double(get(hObject,'String')) returns contents of min1 as a double


% --- Executes during object creation, after setting all properties.
function min1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max1_Callback(hObject, eventdata, handles)
% hObject    handle to max1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max1 as text
%        str2double(get(hObject,'String')) returns contents of max1 as a double


% --- Executes during object creation, after setting all properties.
function max1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ValueA_Callback(hObject, eventdata, handles)
% hObject    handle to ValueA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ValueA as text
%        str2double(get(hObject,'String')) returns contents of ValueA as a double


% --- Executes during object creation, after setting all properties.
function ValueA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ValueA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% A
minv1=str2double(get(handles.min1,'string'));
maxv1=str2double(get(handles.max1,'string'));


set(handles.slider1,'Min',minv1);
set(handles.slider1,'Max',maxv1);


A = get(handles.slider1,'Value');


set(handles.ValueA,'string',num2str(A));

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function min2_Callback(hObject, eventdata, handles)
% hObject    handle to min2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min2 as text
%        str2double(get(hObject,'String')) returns contents of min2 as a double


% --- Executes during object creation, after setting all properties.
function min2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max2_Callback(hObject, eventdata, handles)
% hObject    handle to max2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max2 as text
%        str2double(get(hObject,'String')) returns contents of max2 as a double


% --- Executes during object creation, after setting all properties.
function max2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ValueFreq_Callback(hObject, eventdata, handles)
% hObject    handle to ValueFreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ValueFreq as text
%        str2double(get(hObject,'String')) returns contents of ValueFreq as a double


% --- Executes during object creation, after setting all properties.
function ValueFreq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ValueFreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
minv2=str2double(get(handles.min2,'string'));
maxv2=str2double(get(handles.max2,'string'));

set(handles.slider2,'Min',minv2);
set(handles.slider2,'Max',maxv2);

w = get(handles.slider2,'Value');

set(handles.ValueFreq,'string',num2str(w));

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function t_Callback(hObject, eventdata, handles)
% hObject    handle to t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t as text
%        str2double(get(hObject,'String')) returns contents of t as a double


% --- Executes during object creation, after setting all properties.
function t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in SaveType.
function SaveType_Callback(hObject, eventdata, handles)
% hObject    handle to SaveType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SaveType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SaveType


% --- Executes during object creation, after setting all properties.
function SaveType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SaveType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 % Kullanıcının seçtiği dosya uzantısını al
    selectedExtension = get(handles.SaveType, 'Value');
    
    % Seçilen uzantıya göre dosya adını ve uzantısını belirle
    switch selectedExtension
        case 1
            fileExtension = 'png';
        case 2
            fileExtension = 'jpg';
        case 3
            fileExtension = 'jpeg';
        otherwise
            error('Geçersiz dosya uzantısı seçildi.');
    end
    
    % Dosya adını ve uzantısını birleştirerek tam dosya adını oluştur
    fullFileName = ['output_image.' fileExtension];
    
    % Kullanıcıdan dosya adını ve yolu seçmesini iste
    [fileName, filePath] = uiputfile(['*.' fileExtension], 'Dosyayı Kaydet');
    
    % Kullanıcı dosyayı seçmediyse veya iptal ettiyse işlemi sonlandır
    if fileName == 0
        return;
    end
    
    % Tam dosya adını oluştur
    fullFilePath = fullfile(filePath, fileName);
    
    % Dosyayı kaydet
    % Burada uygun işlemleri gerçekleştirmelisiniz, örneğin:
    % saveas(gcf, fullFilePath);
    disp(['Dosya kaydedildi: ' fullFilePath]);

