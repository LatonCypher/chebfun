function handles = setupPanelFigures(handles)
%SETUPPANELS   Populate the input panel on CHEBGUI

% Background colour for text fields. Ensure that we're using the same one as
% found on the button panel.
textBackgroundColour = get(handles.panel_buttons, 'BackgroundColor');
% Specify the font size of inputs with monospaced font.
monospacedFontsize = 12;
% Specify the font size of panels and text with non-monospaced font.
textFontsize = 12;
% Specify the left margin of the sub-panels.
panelLeftMargin = 0.01;
% Specify the width of the sub-panels (such as inputs for differential equation
% and boundary conditions).
panelWidth = .975;
% Specify the height of the sub-panels.
panelHeight = 0.29;
% The margin where we start the bottom most panel.
bottomPanelMargin = 0.005;
% The left margin for the input boxes inside the subpanels.
inputBoxLeftMargin = 0.025;
% The width of the input boxes within the subpanels.
inputBoxWidth = .95;
% %% Setup the input panel
% handles.panel_input = uipanel('Parent', handles.mainWindow, ...
%     'BackgroundColor', textBackgroundColour, ...
%     'Position', [.46305931321540095 .244 .36 .75275], ...
%     'BorderType', 'etchedin');
% 
%% Panel for space domain
handles.panel_figSol = uipanel('Parent', handles.panel_figures, ...
    'Title', ' ', 'Titleposition', 'centertop',...
    'BackgroundColor', textBackgroundColour, ...
    'Position', [panelLeftMargin .575 panelWidth .425], ...
    'FontSize', textFontsize, ...
    'BorderType', 'none');

handles.fig_sol = axes( 'Parent', handles.panel_figSol, ...
                 'Units', 'normalized', ...
                 'HandleVisibility','callback', ...
                 'Position',[0.105 0.115 0.825 0.85]);

handles.panel_figNorm = uipanel('Parent', handles.panel_figures, ...
 'Title', ' ', 'Titleposition', 'centertop',...
 'BackgroundColor', textBackgroundColour+.1, ...
 'Position', [panelLeftMargin .075 panelWidth .425], ...
 'FontSize', textFontsize, ...
 'BorderType', 'none');

handles.fig_norm = axes( 'Parent', handles.panel_figNorm, ...
 'Units', 'normalized', ...
 'HandleVisibility','callback', ...
 'Position',[0.105 0.115 0.825 0.85]);

end
