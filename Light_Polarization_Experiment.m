function varargout = Light_Polarization_Experiment(varargin)
% LIGHT_POLARIZATION_EXPERIMENT MATLAB code for Light_Polarization_Experiment.fig
%      LIGHT_POLARIZATION_EXPERIMENT, by itself, creates a new LIGHT_POLARIZATION_EXPERIMENT or raises the existing
%      singleton*.
%
%      H = LIGHT_POLARIZATION_EXPERIMENT returns the handle to a new LIGHT_POLARIZATION_EXPERIMENT or the handle to
%      the existing singleton*.
%
%      LIGHT_POLARIZATION_EXPERIMENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LIGHT_POLARIZATION_EXPERIMENT.M with the given input arguments.
%
%      LIGHT_POLARIZATION_EXPERIMENT('Property','Value',...) creates a new LIGHT_POLARIZATION_EXPERIMENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Light_Polarization_Experiment_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Light_Polarization_Experiment_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Light_Polarization_Experiment

% Last Modified by GUIDE v2.5 09-Jul-2013 16:59:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Light_Polarization_Experiment_OpeningFcn, ...
                   'gui_OutputFcn',  @Light_Polarization_Experiment_OutputFcn, ...
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


% --- Executes just before Light_Polarization_Experiment is made visible.
function Light_Polarization_Experiment_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Light_Polarization_Experiment (see VARARGIN)

% Choose default command line output for Light_Polarization_Experiment
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Light_Polarization_Experiment wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Light_Polarization_Experiment_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function alpha_value_Callback(hObject, eventdata, handles)
% hObject    handle to alpha_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha_value as text
%        str2double(get(hObject,'String')) returns contents of alpha_value as a double
 set(handles.slider1,'Value',...
        str2double(get(hObject,'String')));
    alpha = str2double(get(handles.alpha_value,'String'));
    beta = str2double(get(handles.beta_value,'String'));
    set(gcf,'CurrentAxes',handles.axes1);
    process(alpha,beta);
    display_plot(alpha,beta,handles.axes2);

% --- Executes during object creation, after setting all properties.
function alpha_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function beta_value_Callback(hObject, eventdata, handles)
% hObject    handle to beta_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of beta_value as text
%        str2double(get(hObject,'String')) returns contents of beta_value as a double
alpha = str2double(get(handles.alpha_value,'String'));
    beta = str2double(get(handles.beta_value,'String'));
    set(gcf,'CurrentAxes',handles.axes1);
    process(alpha,beta);
    display_plot(alpha,beta,handles.axes2);


% --- Executes during object creation, after setting all properties.
function beta_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to beta_value (see GCBO)
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
    set(handles.alpha_value,'String',...
        num2str(get(hObject,'Value')));
    %alpha = get(handles.alpha_value,'Value')
    alpha = get(hObject,'Value');
    beta = str2double(get(handles.beta_value,'String'));
    set(gcf,'CurrentAxes',handles.axes1);
    process(alpha,beta);
    display_plot(alpha,beta,handles.axes2);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function display_plot(al,be,handles)
    alpha=0:0.01:2*pi;
    beta=be/180*pi;
    I1=cos(alpha).^2;
    I2=cos(alpha-beta).^2;
    LINE_X= ones(1,50)*(al/180*pi);
    LINE_Y = linspace(0,1,50);
    plot(handles,alpha,I1,alpha,I2,LINE_X,LINE_Y)
    axis(handles,'tight')
