%% ===================================================================
%% app1_code.m —— 从 app1.mlapp 中提取的 App Designer 源码（纯文本版）
%% 来源: matlab/document.xml (app1.mlapp 内部源码块)
%% 用途: Python 复现时对照阅读；本文件与 app1.mlapp 内容等价
%% 注意: 不要直接在 MATLAB 中运行本文件（App Designer 管理的类），
%%       改界面/逻辑请回 App Designer 中修改 app1.mlapp
%% ===================================================================
classdef app1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                  matlab.ui.Figure
        lbl_LogArea               matlab.ui.control.Label
        btn_SaveLog               matlab.ui.control.Button
        tt_LogText                matlab.ui.control.TextArea
        lbl_GlobalTitle           matlab.ui.control.Label
        Panel_Main                matlab.ui.container.Panel
        btn_ToInstrument          matlab.ui.control.Button
        btn_ToTest                matlab.ui.control.Button
        btn_ToData                matlab.ui.control.Button
        panel_StatusBar           matlab.ui.container.Panel
        lbl_Time                  matlab.ui.control.Label
        lbl_Switch                matlab.ui.control.Label
        lbl_TempDev               matlab.ui.control.Label
        lbl_VNA                   matlab.ui.control.Label
        Panel_Instrument          matlab.ui.container.Panel
        btn_Initialization        matlab.ui.control.Button
        btn_RefreshAll            matlab.ui.control.Button
        lbl_QuickOpTitle          matlab.ui.control.Label
        sw_Switch4                matlab.ui.control.Switch
        sw_Switch3                matlab.ui.control.Switch
        sw_Switch2                matlab.ui.control.Switch
        sw_Switch1                matlab.ui.control.Switch
        lbl_Switch4               matlab.ui.control.Label
        lbl_Switch3               matlab.ui.control.Label
        lbl_Switch2               matlab.ui.control.Label
        lbl_Switch1               matlab.ui.control.Label
        lbl_SwitchStatusText      matlab.ui.control.Label
        lamp_Switch               matlab.ui.control.Lamp
        lbl_SwitchStatus          matlab.ui.control.Label
        btn_SwitchDisconnect      matlab.ui.control.Button
        btn_SwitchConnect         matlab.ui.control.Button
        dd_Switch                 matlab.ui.control.DropDown
        lbl_SwitchAddr            matlab.ui.control.Label
        lbl_SwitchModel           matlab.ui.control.Label
        lbl_SwitchTitle           matlab.ui.control.Label
        lbl_TempDevStatusText     matlab.ui.control.Label
        lamp_TempDev              matlab.ui.control.Lamp
        lbl_TempDevStatus         matlab.ui.control.Label
        btn_TempDevDisconnect     matlab.ui.control.Button
        btn_TempDevConnect        matlab.ui.control.Button
        dd_TempDev                matlab.ui.control.DropDown
        lbl_TempDevAddr           matlab.ui.control.Label
        lbl_TempDevModel          matlab.ui.control.Label
        lbl_TempDevTitle          matlab.ui.control.Label
        lbl_VNAStatusText         matlab.ui.control.Label
        lamp_VNA                  matlab.ui.control.Lamp
        lbl_VNAStatus             matlab.ui.control.Label
        btn_VNADisconnect         matlab.ui.control.Button
        btn_VNAConnect            matlab.ui.control.Button
        dd_VNA                    matlab.ui.control.DropDown
        lbl_VNAAddr               matlab.ui.control.Label
        lbl_VNAModel              matlab.ui.control.Label
        lbl_VNATitle              matlab.ui.control.Label
        lbl_InstrumentTitle       matlab.ui.control.Label
        btn_BackToMain1           matlab.ui.control.Button
        Panel_Data                matlab.ui.container.Panel
        btn_ExportdielectricData  matlab.ui.control.Button
        btn_Calculatedielectric   matlab.ui.control.Button
        edt_CalB                  matlab.ui.control.NumericEditField
        lbl_CalB                  matlab.ui.control.Label
        edt_CalA                  matlab.ui.control.NumericEditField
        lbl_CalA                  matlab.ui.control.Label
        lbl_Dividingline          matlab.ui.control.Label
        btn_ExportRsData          matlab.ui.control.Button
        btn_CalculateRs           matlab.ui.control.Button
        edt_GeometryFactor        matlab.ui.control.NumericEditField
        lbl_Gvalue                matlab.ui.control.Label
        btn_SelectSampleFolder    matlab.ui.control.Button
        btn_SelectCavityFolder    matlab.ui.control.Button
        lbl_Parametercal          matlab.ui.control.Label
        btn_ExportFitData         matlab.ui.control.Button
        btn_ProcessData           matlab.ui.control.Button
        btn_SelectBatchFolder     matlab.ui.control.Button
        btn_SelectCompareFiles    matlab.ui.control.Button
        btn_SelectSingleFile      matlab.ui.control.Button
        lbl_Fileoperations        matlab.ui.control.Label
        lbl_DataTitle             matlab.ui.control.Label
        btn_BackToMain3           matlab.ui.control.Button
        ax_Lower                  matlab.ui.control.UIAxes
        ax_Upper                  matlab.ui.control.UIAxes
        Panel_Test                matlab.ui.container.Panel
        dd_Sparam                 matlab.ui.control.DropDown
        sw_TempMonitor            matlab.ui.control.Switch
        Label                     matlab.ui.control.Label
        btn_ExportTempExcel       matlab.ui.control.Button
        btn_StopTest              matlab.ui.control.Button
        btn_PauseTest             matlab.ui.control.Button
        btn_StartTest             matlab.ui.control.Button
        lbl_RemainingTime         matlab.ui.control.Label
        lbl_Progress              matlab.ui.control.Label
        lbl_ResonatorHeadTemp     matlab.ui.control.Label
        lbl_ResonatorTemp         matlab.ui.control.Label
        lbl_SampleHeadTemp        matlab.ui.control.Label
        lbl_SampleTemp            matlab.ui.control.Label
        lbl_TempParameter         matlab.ui.control.Label
        lbl_CurrentPath           matlab.ui.control.Label
        btn_SelectSavePath        matlab.ui.control.Button
        edt_SampleName            matlab.ui.control.EditField
        lbl_SampleName            matlab.ui.control.Label
        edt_SaveInterval          matlab.ui.control.NumericEditField
        lbl_SaveInterval          matlab.ui.control.Label
        edt_StableTime            matlab.ui.control.NumericEditField
        lbl_StableTime            matlab.ui.control.Label
        edt_TargetTemp            matlab.ui.control.NumericEditField
        lbl_SetTemp               matlab.ui.control.Label
        edt_RampRate              matlab.ui.control.NumericEditField
        lbl_Ramp                  matlab.ui.control.Label
        lbl_SetTemparameter       matlab.ui.control.Label
        sw_AverageSW              matlab.ui.control.Switch
        btn_Autoscale             matlab.ui.control.Button
        btn_3dBBWSearch           matlab.ui.control.Button
        btn_MarkerOFF             matlab.ui.control.Button
        btn_MarkertoCenter        matlab.ui.control.Button
        edt_AverageCount          matlab.ui.control.NumericEditField
        edt_IFBandwidth           matlab.ui.control.NumericEditField
        edt_Power                 matlab.ui.control.NumericEditField
        edt_Points                matlab.ui.control.NumericEditField
        edt_Span                  matlab.ui.control.NumericEditField
        edt_CenterFreq            matlab.ui.control.NumericEditField
        edt_StopFreq              matlab.ui.control.NumericEditField
        edt_StartFreq             matlab.ui.control.NumericEditField
        lbl_AverageCount          matlab.ui.control.Label
        lbl_IFBandwidth           matlab.ui.control.Label
        lbl_Power                 matlab.ui.control.Label
        lbl_Points                matlab.ui.control.Label
        lbl_Span                  matlab.ui.control.Label
        lbl_CenterFreq            matlab.ui.control.Label
        lbl_StopFreq              matlab.ui.control.Label
        lbl_StartFreq             matlab.ui.control.Label
        btn_IFBandwidthOK         matlab.ui.control.Button
        btn_PowerOK               matlab.ui.control.Button
        btn_PointOK               matlab.ui.control.Button
        btn_SpanFOK               matlab.ui.control.Button
        btn_CenterFOK             matlab.ui.control.Button
        btn_StopFOK               matlab.ui.control.Button
        btn_StarFOK               matlab.ui.control.Button
        lbl_SetVNAparameter       matlab.ui.control.Label
        lbl_TestTitle             matlab.ui.control.Label
        btn_BackToMain2           matlab.ui.control.Button
        btn_EmergencyStop         matlab.ui.control.Button
        ax_TempCurve              matlab.ui.control.UIAxes
    end

    
    properties (Access = private)
        tempMonitorTimer = []  % 外部温度监视定时器
        timerStatus; % 系统时间定时器
        Color_Offline = [0.4 0.4 0.4];  % 未连接/空闲 灰色
        Color_Online  = [0.1 0.6 0.2];   % 已连接/正常 绿色
        Color_Error   = [1.0 0.0 0.0];   % 异常/错误 红色

        % ========== 全局仪器地址管理 ==========
        SelectedAddresses = struct(...
            'vna', '', ...       % 矢网选中的地址
            'tempDev', '', ...   % 控温仪选中的地址
            'switchDev', '' ...  % 同轴开关选中的地址
            );

        % ========== 全局仪器对象 ==========
        vna = [];              % 矢网连接对象
        tempDev = [];          % 控温仪连接对象
        switchDev = [];        % 同轴开关连接对象
        isConnected = false    % 同轴开关连接状态

        % ========== 变温测试运行状态 ==========
        isEmergencyStop = false;   % 急停标志
        isTestRunning = false;     % 是否正在运行测试
        isTestPaused = false;      % 是否暂停
        currentSavePoint = 0;      % 已保存的数据点数量（S2P文件数）
        totalSavePoints = 0;       % 总共需要保存的数据点数量
        lastSaveTemperature = 0;   % 上一次保存数据时的温度
        testStartTime = 0;         % 测试开始时间戳
        dataSavePath = pwd;        % 数据保存路径
        finalTargetTemp = 0;       % 用户设置的最终目标温度

        % ========== 稳定等待状态机 ==========
        isStabilizing = false;     % 是否正在温度稳定等待中
        stabilizeStartTime = 0;    % 稳定等待开始时间戳

        % 绝对温度目标点队列
        targetTempPoints = [];     % 预先计算的所有绝对保存温度点数组
        nextTargetIndex = 1;       % 下一个要到达的目标点索引

        % ========== 温度数据存储 ==========
        timeArray = [];            % 时间数组(min)
        sampleTempArray = [];      % Sample温度数组(K)
        sampleHeadTempArray = [];  % Samplehead温度数组(K)
        resonatorTempArray = [];   % Resonator温度数组(K)
        resonatorHeadTempArray = [];% Resonatorhead温度数组(K)

        testTimer = [];            % 测试主循环定时器
        hTempLine = [];            % 温度曲线的线对象句柄

        % ========== 批量处理数据 ==========
        batchFileList = [];       % 批量处理的文件列表
        % 列：[温度(K), 频率(GHz), 有载Q, 无载Q, 耦合系数β, 残差标准差]
        batchFitResults = [];

        % ========== 空腔/样品数据 ==========
        % 列：[温度(K), 频率(GHz), 有载Q, 无载Q, 耦合系数β, 残差标准差]
        cavityFitData = [];
        sampleFitData = [];

        % ========== 计算结果 ==========
        rsResults = [];           % 表面电阻结果：[温度(K), Rs(Ω)]
        % 列：[温度(K), 样品频率(GHz), 空腔频率(GHz), 样品Q0, 空腔Q0, ε', ε'', tanδ]
        epsilonResults = [];

    end
    
    methods (Access = private)
        
        function updateStatusTimer(app)
            % 刷新系统时间
            app.lbl_Time.Text = "System time：" + string(datetime('now', 'Format', 'HH:mm:ss'));

            % 这里以后可以换成真实温度，现在模拟不变
            % app.lbl_NowTemp.Text = sprintf('当前温度：%.2f K', 你的仪器温度值);
        end

        function switchToPage(app, targetPage)
            % 隐藏所有页面
            app.Panel_Main.Visible = 'off';
            app.Panel_Instrument.Visible = 'off';
            app.Panel_Test.Visible = 'off';
            app.Panel_Data.Visible = 'off';
            app.lbl_GlobalTitle.Visible='off';
            app.lbl_LogArea.Visible = "off";
            app.tt_LogText.Visible = "off";
            app.btn_SaveLog.Visible= 'off';
            
            % 显示目标页面
            switch targetPage
                case 'Main'
                    app.Panel_Main.Visible = 'on';
                    app.lbl_GlobalTitle.Visible ='on';
                    app.lbl_LogArea.Visible = "off";
                    app.tt_LogText.Visible = "off";
                    app.btn_SaveLog.Visible= 'off';
                case 'Instrument'
                    app.Panel_Instrument.Visible = 'on';
                    app.lbl_LogArea.Visible = "on";
                    app.tt_LogText.Visible = "on";
                    app.btn_SaveLog.Visible= 'on';
                case 'Test'
                    app.Panel_Test.Visible = 'on';
                    app.lbl_LogArea.Visible = "on";
                    app.tt_LogText.Visible = "on";
                    app.btn_SaveLog.Visible= 'on';
                case 'Data'
                    app.Panel_Data.Visible = 'on';
                    app.lbl_LogArea.Visible = "on";
                    app.tt_LogText.Visible = "on";
                    app.btn_SaveLog.Visible= 'on';
            end
        end

        function visaAddrs = scanVisaDevices(app)
            try
                % 完全和你原来的代码一样，没有任何多余判断
                resources = visadevlist;
                visaAddrs = resources.ResourceName;
                % 强制返回行向量
                visaAddrs = visaAddrs(:)';

                if ~isempty(visaAddrs)
                    app.addLog(sprintf('VISA扫描完成: 找到 %d 个可用VISA设备', length(visaAddrs)), 'info');

                    % 保留你原有的命令行输出
                    disp("VISA addresses updated at: " + string(datetime('now', 'Format', 'yyyy-MM-dd HH:mm:ss')));
                    disp('Available VISA addresses:');
                    disp(visaAddrs);
                else
                    app.addLog('VISA扫描完成: 未找到可用VISA设备', 'info');
                end

            catch ME
                app.addLog(sprintf('扫描VISA出错: %s', ME.message), 'error');
                visaAddrs = {};
            end
        end

        % 私有函数：扫描VISA设备（返回VISA地址列表）
        % 私有函数：扫描串口端口（完全还原你原有的逻辑）
        function serialAddrs = scanSerialPorts(app)
            try
                % 完全和你原来的代码一样
                ports = serialportlist;
                serialAddrs =ports;
                % 强制返回行向量
                serialAddrs = serialAddrs(:)';

                if ~isempty(serialAddrs) && ~strcmp(serialAddrs{1}, '')
                    app.addLog(sprintf('串口扫描完成: 找到 %d 个可用串口', length(serialAddrs)), 'info');
                else
                    app.addLog('串口扫描完成: 未找到可用串口', 'info');
                    serialAddrs = {};
                end

            catch ME
                app.addLog(sprintf('扫描串口出错: %s', ME.message), 'error');
                serialAddrs = {};
            end
        end

        % ================== 全局日志工具（完全兼容你的调用习惯） ==================
        function addLog(app, message, type)
            % 获取标准时间戳
            timestamp = string(datetime('now', 'Format', 'yyyy-MM-dd HH:mm:ss'));

            % 格式化日志内容（用符号区分类型，直观清晰）
            switch type
                case 'info'
                    prefix = 'ℹ️';
                case 'warning'
                    prefix = '⚠️';
                case 'error'
                    prefix = '❌';
                case 'success'
                    prefix = '✅';
                otherwise
                    prefix = '';
            end

            % 组合最终日志行
            fullMessage = sprintf('[%s] %s %s', timestamp, prefix, message);

            % 逐行追加到cell数组
            currentText = app.tt_LogText.Value;
            if isempty(currentText)
                app.tt_LogText.Value = {fullMessage};
            else
                app.tt_LogText.Value = [currentText; {fullMessage}];
            end

            % 自动滚动
            app.tt_LogText.scroll('bottom');
            drawnow; % 强制刷新界面
        end

        function sendCommand(app, command, description)
            % 发送命令到Arduino
            try
                if ~app.isConnected
                    app.addLog('错误: 未连接到开发板','error');
                    return;
                end

                app.addLog(sprintf('发送命令: %s (%s)', command, description),'info');

                % 发送命令
                write(app.switchDev, command, "char");

                % 等待并读取响应
                pause(0.3);
                if app.switchDev.NumBytesAvailable > 0
                    response = readline(app.switchDev);
                    app.addLog(sprintf('开发板响应: %s', strtrim(response)),'info');
                else
                    app.addLog('警告: 无响应','error');
                end

            catch ME
                app.addLog(sprintf('发送命令时出错: %s', ME.message),'error');
            end
        end

        % 私有函数：读取所有4路温度并更新界面显示
        function temp = readAllTemperatures(app)
            % Lake Shore 336 标准读温指令
            flushinput(app.tempDev);
            temp.sample = str2double(query(app.tempDev, 'KRDG? A'));
            temp.sampleHead = str2double(query(app.tempDev, 'KRDG? B'));
            temp.resonator = str2double(query(app.tempDev, 'KRDG? C'));
            temp.resonatorHead = str2double(query(app.tempDev, 'KRDG? D'));

            % 更新界面数字显示
            app.lbl_SampleTemp.Text = sprintf('Sample: %.2f K', temp.sample);
            app.lbl_SampleHeadTemp.Text = sprintf('Samplehead: %.2f K', temp.sampleHead);
            app.lbl_ResonatorTemp.Text = sprintf('Resonator: %.2f K', temp.resonator);
            app.lbl_ResonatorHeadTemp.Text = sprintf('Resonatorhead: %.2f K', temp.resonatorHead);
        end

        function startTempMonitor(app)
            if ~isempty(app.tempMonitorTimer) && isvalid(app.tempMonitorTimer)
                stop(app.tempMonitorTimer);
                delete(app.tempMonitorTimer);
            end
            app.tempMonitorTimer = timer(...
                'Period', 1, ...
                'ExecutionMode', 'fixedRate', ...
                'BusyMode', 'drop', ...
                'TimerFcn', @(~,~) tempMonitorLoop(app), ...
                'ErrorFcn', @(~,~) app.addLog('温度监视出错', 'error'));
            start(app.tempMonitorTimer);
            % 同步开关状态
            app.sw_TempMonitor.Value = "On";
        end

        function stopTempMonitor(app)
            if ~isempty(app.tempMonitorTimer) && isvalid(app.tempMonitorTimer)
                stop(app.tempMonitorTimer);
                delete(app.tempMonitorTimer);
                app.tempMonitorTimer = [];
            end
            % 同步开关状态
            app.sw_TempMonitor.Value = "Off";
        end

        function tempMonitorLoop(app)
            try
                if app.isTestRunning && ~app.isTestPaused
                    return;  % 测试正常运行中，不读取
                end
                readAllTemperatures(app);
            catch
            end
        end

        % 私有函数：测试主循环（每秒执行1次，极简可靠版）
        function testMainLoop(app)
            try
                % ========== 全局状态检查 ==========
                if app.isEmergencyStop
                    return;
                end

                % 如果监视定时器正在运行，说明逻辑有误，停止它
                if ~isempty(app.tempMonitorTimer) && strcmp(app.tempMonitorTimer.Running, 'on')
                    stopTempMonitor(app);
                end
                
                if ~app.isTestRunning || app.isTestPaused
                    return;
                end

                % ========== 1. 读取并更新温度 ==========
                temp = readAllTemperatures(app);
                currentTime = toc(app.testStartTime) / 60; % 转换为分钟

                % ========== 2. 高性能滚动曲线更新 ==========
                app.timeArray(end+1) = currentTime;
                app.sampleTempArray(end+1) = temp.sample;
                app.sampleHeadTempArray(end+1) = temp.sampleHead;
                app.resonatorTempArray(end+1) = temp.resonator;
                app.resonatorHeadTempArray(end+1) = temp.resonatorHead;

                set(app.hTempLine, 'XData', app.timeArray, 'YData', app.sampleTempArray);

                % 动态X轴：显示最近30分钟
                if currentTime <= 30
                    xlim(app.ax_TempCurve, [0, 30]);
                else
                    xlim(app.ax_TempCurve, [currentTime - 30, currentTime]);
                end

                ylim(app.ax_TempCurve, 'auto');

                % ========== 3. 核心触发逻辑 ==========
                stableTime = app.edt_StableTime.Value;
                sampleName = strtrim(app.edt_SampleName.Value);

                if ~app.isStabilizing
                    % ==============================================
                    % 状态1：正常升温中
                    % 温度≥下一个绝对目标点 → 触发稳定
                    % ==============================================
                    if app.nextTargetIndex <= app.totalSavePoints
                        nextTarget = app.targetTempPoints(app.nextTargetIndex);

                        if temp.sample >= nextTarget
                            app.addLog(sprintf('📍 到达目标温度点: %.2f K（实际温度: %.2f K）', nextTarget, temp.sample), 'info');

                            % 进入稳定等待状态
                            app.isStabilizing = true;
                            app.stabilizeStartTime = tic;

                            % 锁定控温仪到精确目标温度
                            fprintf(app.tempDev, sprintf('SETP 1,%.2f', nextTarget));
                            app.addLog(sprintf('🔒 控温仪已锁定到目标温度 %.2f K，开始稳定等待', nextTarget), 'info');

                            % 执行矢网自动带宽调整（与稳定等待并行）
                            app.addLog('🔍 正在执行矢网自动带宽调整...', 'info');

                            flushinput(app.vna);
                            fprintf(app.vna, 'CALC:MEAS:MARK:BWID:DATA?');
                            pause(0.1);
                            resp = fscanf(app.vna);                        % 返回字符串，如 "1.958E+6,1.797E+10,9.176E+3,-8.588E+1"
                            data = sscanf(resp, '%f,', [1, 4]);            % 解析为四个浮点数
                            bw = data(1);        % 带宽 (Hz)
                            centerFreq = data(2);% 中心频率 (Hz)

                            span = bw * 5;
                            fprintf(app.vna, sprintf('SENS:FREQ:CENTER %f', centerFreq));
                            fprintf(app.vna, sprintf('SENS:FREQ:SPAN %f', span));
                            fprintf(app.vna, 'CALC:MEAS:MARK:SET CENT');

                            app.addLog('✅ 矢网带宽调整完成，等待温度稳定', 'info');
                        end
                    end

                else
                    % ==============================================
                    % 状态2：稳定等待中
                    % ==============================================
                    elapsedStabilizeTime = toc(app.stabilizeStartTime);

                    % 显示稳定倒计时
                    remainingStabilizeTime = max(0, stableTime - elapsedStabilizeTime);
                    app.lbl_RemainingTime.Text = sprintf('稳定倒计时: %.0f s', remainingStabilizeTime);

                    if elapsedStabilizeTime >= stableTime
                        % 稳定时间到，执行数据保存
                        app.addLog('✅ 温度稳定完成，正在保存数据...', 'info');

                        % 保存S2P文件
                        currentTarget = app.targetTempPoints(app.nextTargetIndex);
                        fileName = sprintf('%s_%.2fK.s2p', sampleName, currentTarget);
                        fullPath = fullfile(app.dataSavePath, fileName);
                        fprintf(app.vna, sprintf('mmemory:store "%s"', fullPath));

                        app.addLog(sprintf('✅ 数据已保存: %s（实际温度: %.3f K）', fileName, temp.sample), 'success');

                        % 恢复控温仪到最终目标温度，继续升温
                        fprintf(app.tempDev, sprintf('SETP 1,%.2f', app.finalTargetTemp));
                        app.addLog('🔓 控温仪已恢复到最终目标温度，继续升温', 'info');

                        % 退出稳定等待状态，指向下一个绝对目标点
                        app.isStabilizing = false;
                        app.nextTargetIndex = app.nextTargetIndex + 1;

                        % 更新测试进度
                        app.currentSavePoint = app.currentSavePoint + 1;
                        app.lbl_Progress.Text = sprintf('已保存数据点: %d/%d', app.currentSavePoint, app.totalSavePoints);

                        % 恢复预计剩余时间显示（固定0.5K/min计算，更准确）
                        remainingTemp = app.finalTargetTemp - temp.sample;
                        remainingTime = remainingTemp / app.edt_RampRate.Value;
                        app.lbl_RemainingTime.Text = sprintf('预计剩余时间: %.0f min', max(0, remainingTime));
                    end
                end

                % ========== 4. 检查是否完成所有目标点 ==========
                if ~app.isStabilizing && app.nextTargetIndex > app.totalSavePoints
                    app.addLog('🎯 所有目标温度点已完成，正在保存最终数据...', 'success');

                    % 保存最后一个数据点
                    fileName = sprintf('%s_FINAL_%.2fK.s2p', sampleName, temp.sample);
                    fullPath = fullfile(app.dataSavePath, fileName);
                    fprintf(app.vna, sprintf('mmemory:store "%s"', fullPath));

                    app.addLog(sprintf('✅ 最终数据已保存: %s', fileName), 'success');

                    % 停止测试主循环
                    stop(app.testTimer);
                end

            catch ME
                app.addLog(sprintf('❌ 测试主循环出错: %s', ME.message), 'error');
                stop(app.testTimer);
            end
        end

        % 私有函数：测试完成自动清理
        function testCleanup(app)

            if app.isEmergencyStop
                % 急停情况：只做最基础的界面恢复，不保存数据，不操作仪器
                app.addLog('⚠️ 急停模式，跳过数据保存。', 'warning');
                app.isTestRunning = false;
                app.btn_StartTest.Enable = 'on';
                app.btn_PauseTest.Enable = 'off';
                app.btn_PauseTest.Text = '暂停';
                app.btn_StopTest.Enable = 'off';
                % 尝试删除定时器（如果还在）
                if ~isempty(app.testTimer) && isvalid(app.testTimer)
                    delete(app.testTimer);
                    app.testTimer = [];
                end
                return;
            end

            try
                % ========== 关闭控温仪加热（不断开仪器连接） ==========
                % 发送关闭命令                
                fprintf(app.tempDev, 'RAMP 1,0,0');
                fprintf(app.tempDev, 'SETP 1,0');
                fprintf(app.tempDev, 'RANGE 1,0');

                try
                    fprintf(app.tempDev, '*OPC?');
                    resp = fscanf(app.tempDev);
                    if strcmp(strtrim(resp), '1')
                        app.addLog('✅ 加热已安全关闭', 'success');
                    else
                        app.addLog('⚠️ 加热关闭确认异常', 'warning');
                    end
                catch
                    app.addLog('⚠️ 加热关闭确认超时，请手动检查', 'warning');
                end

                % ========== 重置界面状态 ==========
                app.isTestRunning = false;
                app.isStabilizing = false;
                app.btn_StartTest.Enable = 'on';
                app.btn_PauseTest.Enable = 'off';
                app.btn_PauseTest.Text = '暂停';
                app.btn_StopTest.Enable = 'off';

                app.addLog(sprintf('✅ 所有数据已保存，共保存 %d 个数据点', app.currentSavePoint), 'success');

                %重置测试属性
                app.currentSavePoint = 0;
                app.nextTargetIndex = 1;
                app.lastSaveTemperature = 0;
                app.timeArray = [];
                app.sampleTempArray = [];
                app.sampleHeadTempArray = [];
                app.resonatorTempArray = [];
                app.resonatorHeadTempArray = [];

            catch ME
                app.addLog(sprintf('❌ 测试清理出错: %s', ME.message), 'error');
            end

            % 关闭定时器
            if ~isempty(app.testTimer) && isvalid(app.testTimer)
                delete(app.testTimer);
                app.testTimer = [];
            end
            % 重启监视定时器，保持空闲时的温度显示
            startTempMonitor(app);
        end

        function [freq_GHz, s21_complex] = readS2PFile(app, fullpath)%#ok<INUSD>
            % 尝试使用 RF Toolbox，失败则手动解析
            try
                data = read(rfdata.data, fullpath);
                F = data.Freq / 1e9;            % 转换为 GHz
                S = data.S_Parameters;
                D = squeeze(S(2,1,:));
            catch
                % 手动解析 ASCII
                raw_data = load(fullpath, '-ascii');
                F = raw_data(:, 1);
                if max(abs(raw_data(:,4))) > 1   % 幅度(dB) + 相位(度) 格式
                    S21_dB = raw_data(:, 4);
                    S21_phase_deg = raw_data(:, 5);
                    S21_mag = 10.^(S21_dB / 20);
                    S21_phase_rad = deg2rad(S21_phase_deg);
                    D = S21_mag .* (cos(S21_phase_rad) + 1j*sin(S21_phase_rad));
                else                            % 实部 + 虚部 格式
                    DR = raw_data(:, 4);
                    DI = raw_data(:, 5);
                    D = DR + 1j*DI;
                end
                    F = F / 1e9;
            end
            freq_GHz = F;
            s21_complex = D;
        end

        function Temp = extractTemperature(app, filename)%#ok<INUSD>
            Temp = NaN;
            pat = digitsPattern(1,3) + "." + digitsPattern(1,4) + "K";
            matches = extract(filename, pat);
            if ~isempty(matches)
                num_str = extractBefore(matches, 'K');
                Temp = str2double(num_str);
            end
        end

        function [F_clean, D_clean, status] = cleanDataUsingInitialValue(app, F, D, Fr, QL)%#ok<INUSD>
            status = "Success";
            BW_theory = Fr / QL;
            crop_factor = 3;
            F_min = max(Fr - crop_factor * BW_theory, min(F));
            F_max = min(Fr + crop_factor * BW_theory, max(F));
            idx_crop = F >= F_min & F <= F_max;
            F_crop = F(idx_crop);
            D_crop = D(idx_crop);

            if length(F_crop) < 200
                crop_factor = 5;
                F_min = max(Fr - crop_factor * BW_theory, min(F));
                F_max = min(Fr + crop_factor * BW_theory, max(F));
                idx_crop = F >= F_min & F <= F_max;
                F_crop = F(idx_crop);
                D_crop = D(idx_crop);
                status = "Expanded crop";
            end

            max_fit_points = 5000;
            if length(F_crop) > max_fit_points
                idx_down = round(linspace(1, length(F_crop), max_fit_points));
                F_crop = F_crop(idx_down);
                D_crop = D_crop(idx_down);
            end

            F_clean = F_crop;
            D_clean = D_crop;
        end

        function [Fseed, Qseed, fr_cf, QL_cf] = getInitialValueRANSACCircleFit(app, F_GHz, S21)%#ok<INUSD>
            f_Hz = F_GHz * 1e9;

            % 第一步：自适应截取
            mag = abs(S21);
            mag_smooth = medfilt1(mag, 7);
            [mag_peak, idx_peak] = max(mag_smooth);
            f_peak_Hz = f_Hz(idx_peak);

            half_power = mag_peak / sqrt(2);
            left = find(mag_smooth(1:idx_peak) <= half_power, 1, 'last');
            right = find(mag_smooth(idx_peak:end) <= half_power, 1, 'first');
            if ~isempty(left) && ~isempty(right)
                BW_est_Hz = f_Hz(idx_peak+right-1) - f_Hz(left);
                Q_est = f_peak_Hz / BW_est_Hz;
            else
                BW_est_Hz = (f_Hz(end) - f_Hz(1)) / 5;
                Q_est = f_peak_Hz / BW_est_Hz;
            end

            if Q_est > 1e5
                crop_multiplier = 3;
            elseif Q_est > 1e4
                crop_multiplier = 8;
            else
                crop_multiplier = 20;
            end

            span_Hz = crop_multiplier * max(BW_est_Hz, 1e3);
            idx = (f_Hz >= f_peak_Hz - span_Hz) & (f_Hz <= f_peak_Hz + span_Hz);
            f_sub_Hz = f_Hz(idx);
            S21_sub = S21(idx);
            N = length(f_sub_Hz);
            while N < 100
                span_Hz = span_Hz * 1.5;
                idx = (f_Hz >= f_peak_Hz - span_Hz) & (f_Hz <= f_peak_Hz + span_Hz);
                f_sub_Hz = f_Hz(idx);
                S21_sub = S21(idx);
                N = length(f_sub_Hz);
            end

            % 第二步：RANSAC 圆拟合
            x = real(S21_sub);
            y = imag(S21_sub);
            max_iter = 150;
            inlier_thresh = 0.15 * max(abs(S21_sub));
            best_inliers = [];
            for j = 1:max_iter
                sample_idx = randperm(N, 3);
                x_sample = x(sample_idx); y_sample = y(sample_idx);
                A = [2*x_sample, 2*y_sample, ones(3,1)];
                b = x_sample.^2 + y_sample.^2;
                if rank(A) < 3, continue; end
                p = A \ b;
                Cx = p(1); Cy = p(2); R = sqrt(p(3) + Cx^2 + Cy^2);
                distances = abs(sqrt((x-Cx).^2 + (y-Cy).^2) - R);
                inliers = find(distances < inlier_thresh);
                if length(inliers) > length(best_inliers)
                    best_inliers = inliers;
                end
            end

            % 内点重拟合
            x_in = x(best_inliers); y_in = y(best_inliers);
            A = [2*x_in, 2*y_in, ones(length(x_in),1)];
            b = x_in.^2 + y_in.^2;
            p = A \ b;
            Cx = p(1); Cy = p(2); R = sqrt(p(3) + Cx^2 + Cy^2);

            % 第三步：谐振点定位（圆上离原点最远点）
            C_mag = sqrt(Cx^2 + Cy^2);
            if C_mag < 1e-12
                S21_0 = R;
            else
                S21_0 = (Cx + R*Cx/C_mag) + 1j*(Cy + R*Cy/C_mag);
            end
            [~, idx_res] = min(abs(S21_sub - S21_0));
            f0_Hz = f_sub_Hz(idx_res);

            % 第四步：局部相位法计算 QL
            BW_local = f0_Hz / Q_est;
            idx_local = (f_sub_Hz >= f0_Hz - BW_local) & (f_sub_Hz <= f0_Hz + BW_local);
            f_local = f_sub_Hz(idx_local);
            x_local = x_in(idx_local); y_local = y_in(idx_local);
            theta = unwrap(atan2(y_local - Cy, x_local - Cx));
            f_mean = mean(f_local); f_std = std(f_local);
            f_norm = (f_local - f_mean) / f_std;
            w = abs(gradient(theta, f_norm)); w = w / max(w);
            W = diag(w);
            A_theta = [f_norm, ones(length(f_norm),1)];
            p_theta = (A_theta' * W * A_theta) \ (A_theta' * W * theta);
            dtheta_df = p_theta(1) / f_std;
            QL = abs(f0_Hz * dtheta_df / 2);
            QL = max(1e2, min(QL, 2e7));

            fr_cf = f0_Hz / 1e9;
            QL_cf = QL;
            Fseed = fr_cf;
            Qseed = QL_cf;
        end

        function sv = initialFit(app, F, S, N, EstimatedResFreq, Qseed)%#ok<INUSD>
            N2 = 2*N;
            X = zeros(5, N2);
            G = zeros(N2, 1);
            P = zeros(1, N2);
            for i = 1:N
                i2 = i + N;
                t = 2.0 * (F(i)/EstimatedResFreq - 1.0);
                y = abs(1.0 / (1.0 + 1j*Qseed*t));
                P(i) = y*y; P(i2) = P(i);
                X(1,i) = t;   X(1,i2) = 0.0;
                X(2,i) = 0.0; X(2,i2) = t;
                X(3,i) = 1.0; X(3,i2) = 0.0;
                X(4,i) = 0.0; X(4,i2) = 1.0;
                v1 = S(i);
                G(i) = real(v1); G(i2) = imag(v1);
                v2 = v1 * t;
                X(5,i) = imag(v2); X(5,i2) = -real(v2);
            end
            M = X.';
            T = X .* P;
            C = T * M;
            q = T * G;
            col_norms = sqrt(sum(C.^2, 1))';
            col_norms(col_norms < 1e-12) = 1;
            D = diag(1 ./ col_norms);
            C_scaled = D * C * D;
            q_scaled = D * q;
            sv_scaled = C_scaled \ q_scaled;
            sv = D * sv_scaled;
        end

        function PV = angularWts(app, F, Fr, QL)%#ok<INUSD>
            ptmp = 2.0 * QL * (F - Fr) / Fr;
            PV = 1 ./ (ptmp.^2 + 1.0);
        end

            function [mv, RMS_Error, min_RCOND] = optimiseFit6(app, F, S, N, EstimatedResFreq, sv, loop_plan, Tol, quiet)
                N2 = N*2;
                G = zeros(N2,1);
                PV = ones(N,1);  P = eye(N2);
                m1 = sv(2)/sv(5); m2 = -sv(1)/sv(5);
                m3 = sv(3)-m1; m4 = sv(4)-m2;
                m5 = sv(5);
                Flwst = F(1);
                m6 = Flwst * m5 / EstimatedResFreq;
                RMS_Error = 0;
                min_RCOND = Inf;
                lambda = 1e-4;
                max_iter = 100;

                for k = 1:length(loop_plan)
                    op = loop_plan(k);
                    if op == 'w'
                        PV = app.angularWts(F, Flwst*m5/m6, m5);
                        PA = vertcat(PV,PV); P = diag(PA);
                        continue;
                    elseif op == 'c'
                        seek_convergence = 1;
                    elseif op == 'f'
                        seek_convergence = 0;
                    else
                        if ~quiet
                            disp('Unexpected character in loop_plan');
                        end
                    end

                    TerminationConditionMet = 0;
                    Valid_Last_RMS_Error = 0;
                    iter_count = 0;

                    while ~TerminationConditionMet && iter_count < max_iter
                        iter_count = iter_count + 1;

                        if any(isnan([m1,m2,m3,m4,m5,m6])) || any(isinf([m1,m2,m3,m4,m5,m6]))
                            m1 = sv(2)/sv(5); m2 = -sv(1)/sv(5);
                            m3 = sv(3)-m1; m4 = sv(4)-m2;
                            m5 = sv(5); m6 = Flwst*m5/EstimatedResFreq;
                            lambda = lambda * 10;
                        end

                        X = zeros(6, N2); has_inf = 0;
                        for i = 1:N
                            i2 = i+N;
                            denom = 1.0 + 2j*(m6*F(i)/Flwst - m5);
                            if abs(denom) < 1e-12, y = 1.0; else, y = 1.0/denom; end
                            if isnan(y) || isinf(y), has_inf = 1; y = 0; end
                            X(1,i)=1; X(1,i2)=0;
                            X(2,i)=0; X(2,i2)=1;
                            X(3,i)=real(y); X(3,i2)=imag(y);
                            X(4,i)=-imag(y); X(4,i2)=real(y);
                            u = (1j*m3-m4)*y*y*2;
                            X(5,i)=real(u); X(5,i2)=imag(u);
                            u = -u*F(i)/Flwst;
                            X(6,i)=real(u); X(6,i2)=imag(u);
                            v = m1+1j*m2 + (m3+1j*m4)*y;
                            r = S(i) - v;
                            G(i)=real(r); G(i2)=imag(r);
                        end
                        if has_inf, lambda = lambda * 10; continue; end

                        M = X.'; T = X*P; C_mat = T*M; q = T*G;
                        col_norms = sqrt(sum(C_mat.^2, 1))';
                        col_norms(col_norms < 1e-12) = 1;
                        D = diag(1 ./ col_norms);
                        C_scaled = D * C_mat * D;
                        q_scaled = D * q;
                        C_scaled = C_scaled + lambda * eye(6);
                        current_RCOND = rcond(C_scaled);
                        if isnan(current_RCOND), lambda = lambda*100; continue; end
                        if current_RCOND < min_RCOND, min_RCOND = current_RCOND; end

                        try
                            dm_scaled = C_scaled \ q_scaled;
                            dm = D * dm_scaled;
                        catch
                            lambda = lambda * 100; continue;
                        end

                        m1_new = m1 + dm(1); m2_new = m2 + dm(2); m3_new = m3 + dm(3);
                        m4_new = m4 + dm(4); m5_new = m5 + dm(5); m6_new = m6 + dm(6);

                        SumNum_new = 0; SumDen_new = 0;
                        for i=1:N
                            den = 1.0 + 2j*(m6_new*F(i)/Flwst - m5_new);
                            if abs(den) < 1e-12
                                E = S(i) - (m1_new+1j*m2_new) - (m3_new+1j*m4_new);
                            else
                                E = S(i) - (m1_new+1j*m2_new) - (m3_new+1j*m4_new)/den;
                            end
                            ip = PV(i);
                            SumNum_new = SumNum_new + ip*(real(E)^2 + imag(E)^2);
                            SumDen_new = SumDen_new + ip;
                        end
                        RMS_Error_new = sqrt(SumNum_new/SumDen_new);

                        if RMS_Error_new < RMS_Error || ~Valid_Last_RMS_Error
                            m1=m1_new; m2=m2_new; m3=m3_new; m4=m4_new; m5=m5_new; m6=m6_new;
                            RMS_Error = RMS_Error_new;
                            lambda = lambda * 0.1;
                            if seek_convergence && Valid_Last_RMS_Error
                                delta_S = abs(RMS_Error - Last_RMS_Error);
                                TerminationConditionMet = (delta_S < Tol);
                            else
                                TerminationConditionMet = 1;
                            end
                            Valid_Last_RMS_Error = 1;
                            Last_RMS_Error = RMS_Error;
                        else
                            lambda = lambda * 10;
                            if lambda > 1e12, TerminationConditionMet = 1; end
                        end
                    end
                end

                QL = m5;
                FL = m5*Flwst/m6;
                mv = [m1, m2, m3, m4, QL, FL];
            end

        function [param_std, sigma_res, QL_std, QU_std, fr_std] = computeParameterErrors(app, F, D, mv)%#ok<INUSD>
            m1 = mv(1); m2 = mv(2); m3 = mv(3); m4 = mv(4);
            QL = mv(5); FL = mv(6);
            N = length(F);

            J0 = zeros(2*N, 6);
            r_vec = zeros(2*N, 1);

            for i = 1:N
                i2 = i + N;
                t = F(i) / FL;
                denom = 1.0 + 2j * QL * (t - 1);
                if abs(denom) < 1e-12, y = 1.0; else, y = 1.0 / denom; end

                S_model = (m1 + 1j*m2) + (m3 + 1j*m4) * y;
                r = D(i) - S_model;
                r_vec(i)  = real(r);
                r_vec(i2) = imag(r);

                J0(i,1) = 1;   J0(i2,1) = 0;
                J0(i,2) = 0;   J0(i2,2) = 1;
                J0(i,3) = real(y);  J0(i2,3) = imag(y);
                J0(i,4) = -imag(y); J0(i2,4) = real(y);

                u_QL = (1j*m3 - m4) * 2 * y^2 * (1 - t);
                J0(i,5) = real(u_QL);  J0(i2,5) = imag(u_QL);

                u_FL = (1j*m3 - m4) * 2 * y^2 * QL * t / FL;
                J0(i,6) = real(u_FL);  J0(i2,6) = imag(u_FL);
            end

            col_norms = sqrt(sum(J0.^2, 1))';
            col_norms(col_norms < 1e-12) = 1;
            D_col = diag(1 ./ col_norms);
            J_scaled = J0 * D_col;

            residual_sum_sq = r_vec' * r_vec;
            sigma2_hat = residual_sum_sq / (2*N - 6);
            sigma_res = sqrt(sigma2_hat);

            JtJ_scaled = J_scaled' * J_scaled;
            rc = rcond(JtJ_scaled);
            if rc < 1e-12
                warning('Even after scaling, J^T*J is nearly singular (rcond=%e). Parameter std may be unreliable.', rc);
            end

            try
                C_scaled = sigma2_hat * (JtJ_scaled \ eye(6));
                C = D_col * C_scaled * D_col;
                param_std = sqrt(diag(C))';
            catch
                param_std = nan(1,6); QL_std = NaN; QU_std = NaN; fr_std = NaN;
                return;
            end

            QL_std = param_std(5);
            fr_std = param_std(6);

            % Qu 的误差传递
            a = m1 + m3; b = m2 + m4;
            r_mag = sqrt(a^2 + b^2);
            if r_mag >= 1.0
                QU_std = NaN; return;
            end
            if r_mag < 1e-12
                dQu_da = 0; dQu_db = 0;
            else
                common = QL / (1 - r_mag)^2 / r_mag;
                dQu_da = common * a;
                dQu_db = common * b;
            end
            grad_Qu = [dQu_da; dQu_db; dQu_da; dQu_db; 1/(1 - r_mag); 0];
            QU_var = grad_Qu' * C * grad_Qu;
            if QU_var > 0
                QU_std = sqrt(QU_var);
            else
                QU_std = NaN;
            end
        end

        function [temp_K, f0_GHz, QL, Q0, beta, sigma_res, ...
                F_used, D_used, mv] = fitSingleS2P(app, fullPath)
            % 读取数据
            [F, D] = app.readS2PFile(fullPath);
            [~, name, ~] = fileparts(fullPath);
            temp_K = app.extractTemperature(name);

            % 初值提取
            try
                [Fseed, Qseed, ~, ~] = app.getInitialValueRANSACCircleFit(F, D);
            catch
                DMg = abs(D);
                [~, idx] = max(DMg);
                Fseed = F(idx);
                Qseed = 5.0 * Fseed / (max(F) - min(F));
            end

            % 自适应裁剪（保留 F_used, D_used）
            [F_used, D_used, ~] = app.cleanDataUsingInitialValue(F, D, Fseed, Qseed);

            % 初始拟合
            sv = app.initialFit(F_used, D_used, length(F_used), Fseed, Qseed);
            Tol = max(abs(D_used)) * 1.0e-5;
            [mv, ~, ~] = app.optimiseFit6(F_used, D_used, length(F_used), Fseed, sv, 'fwfwfwc', Tol, 1);

            QL = mv(5);
            f0_GHz = mv(6);

            % 无载Q和耦合系数
            S21_res = (mv(1)+mv(3)) + 1j*(mv(2)+mv(4));
            abs_res = abs(S21_res);
            if abs_res < 1.0 && abs_res > 0
                Q0   = QL / (1 - abs_res);
                beta = abs_res / (1 - abs_res);
            else
                Q0 = NaN; beta = NaN;
            end

            % 残差标准差
            try
                [~, sigma_res] = app.computeParameterErrors(F_used, D_used, mv);
            catch
                sigma_res = NaN;
            end
        end

    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            % ========== 重置所有仪器状态 ==========
            app.lamp_VNA.Color = app.Color_Offline;
            app.lbl_VNAStatusText.Text = 'Disconnected';
            app.lbl_VNAStatusText.FontColor = app.Color_Offline;
            app.btn_VNAConnect.Enable = 'on';
            app.btn_VNADisconnect.Enable = 'on';

            app.lamp_TempDev.Color = app.Color_Offline;
            app.lbl_TempDevStatusText.Text = 'Disconnected';
            app.lbl_TempDevStatusText.FontColor = app.Color_Offline;
            app.btn_TempDevConnect.Enable = 'on';
            app.btn_TempDevDisconnect.Enable = 'on';

            app.lamp_Switch.Color = app.Color_Offline;
            app.lbl_SwitchStatusText.Text = 'Disconnected';
            app.lbl_SwitchStatusText.FontColor = app.Color_Offline;
            app.btn_SwitchConnect.Enable = 'on';
            app.btn_SwitchDisconnect.Enable = 'on';

            % 禁用所有开关
            app.sw_Switch1.Enable = 'off';
            app.sw_Switch2.Enable = 'off';
            app.sw_Switch3.Enable = 'off';
            app.sw_Switch4.Enable = 'off';

            % ========== 状态栏初始默认文字 ==========
            app.lbl_VNA.Text      = 'VNA: Disconnected';
            app.lbl_TempDev.Text  = 'Temperature controller: Disconnected';
            app.lbl_Switch.Text   = 'Coaxial switch: Disconnected';
            app.lbl_Time.Text     = 'System time:--:--:--';

            % 初始灰色
            app.lbl_VNA.FontColor     = app.Color_Offline;
            app.lbl_TempDev.FontColor = app.Color_Offline;
            app.lbl_Switch.FontColor  = app.Color_Offline;

            % 启动定时器 每秒刷新时间
            app.timerStatus = timer;
            app.timerStatus.Period = 1;
            app.timerStatus.ExecutionMode = 'fixedRate';
            app.timerStatus.TimerFcn = @(s,e) updateStatusTimer(app);
            start(app.timerStatus);
        end

        % Close request function: UIFigure
        function UIFigureCloseRequest(app, event)
            % 1. 停止并删除测试定时器
            if ~isempty(app.testTimer) && isvalid(app.testTimer)
                stop(app.testTimer);
                delete(app.testTimer);
                app.testTimer = [];
            end

            % 2. 停止并删除外部监视定时器
            if ~isempty(app.tempMonitorTimer) && isvalid(app.tempMonitorTimer)
                stop(app.tempMonitorTimer);
                delete(app.tempMonitorTimer);
                app.tempMonitorTimer = [];
            end

            % 3. 停止并删除系统时间定时器（如果存在）
            if ~isempty(app.timerStatus) && isvalid(app.timerStatus)
                stop(app.timerStatus);
                delete(app.timerStatus);
                app.timerStatus = [];
            end
            delete(app);
        end

        % Button pushed function: btn_ToInstrument
        function btn_ToInstrumentButtonPushed(app, event)
            app.switchToPage('Instrument');
        end

        % Button pushed function: btn_ToTest
        function btn_ToTestButtonPushed(app, event)
            app.switchToPage('Test');
        end

        % Button pushed function: btn_ToData
        function btn_ToDataButtonPushed(app, event)
            app.switchToPage('Data');
        end

        % Button pushed function: btn_BackToMain1
        function btn_BackToMain1ButtonPushed(app, event)
            app.switchToPage('Main');
        end

        % Button pushed function: btn_BackToMain2
        function btn_BackToMain2ButtonPushed(app, event)
            app.switchToPage('Main');
        end

        % Button pushed function: btn_BackToMain3
        function btn_BackToMain3ButtonPushed(app, event)
            app.switchToPage('Main');
        end

        % Button pushed function: btn_RefreshAll
        function btn_RefreshAllButtonPushed(app, event)
            try
                % ========== 1. 调用私有函数扫描所有设备 ==========
                serialAddrs = app.scanSerialPorts();
                visaAddrs = app.scanVisaDevices();

                % ========== 2. 合并地址并去重 ==========
                allAddresses = [serialAddrs, visaAddrs];
                allAddresses = unique(allAddresses);

                % 统计设备数量
                realDeviceCount = length(allAddresses);
                % 处理空结果
                if isempty(allAddresses)
                    allAddresses = {'未找到任何可用设备'};
                end

                % ========== 3. 同时更新三个仪器的下拉框 ==========
                app.dd_VNA.Items = allAddresses;
                app.dd_VNA.Value = allAddresses{1};

                app.dd_TempDev.Items = allAddresses;
                app.dd_TempDev.Value = allAddresses{1};

                app.dd_Switch.Items = allAddresses;
                app.dd_Switch.Value = allAddresses{1};

                % ========== 4. 自动同步到全局地址属性 ==========
                app.SelectedAddresses.vna = app.dd_VNA.Value;
                app.SelectedAddresses.tempDev = app.dd_TempDev.Value;
                app.SelectedAddresses.switchDev = app.dd_Switch.Value;

                % ========== 6. 显示最终结果 ==========
                if realDeviceCount > 0
                    app.addLog(sprintf('所有仪器地址刷新完成，共找到 %d 个可用设备', realDeviceCount), 'success');
                    app.addLog('可用设备列表：', 'info');
                    for i = 1:length(allAddresses)
                        app.addLog(sprintf('  %d. %s', i, allAddresses{i}), 'info');
                    end
                else
                    app.addLog('所有仪器地址刷新完成，未找到任何可用设备', 'warning');
                end

            catch ME
                app.addLog(sprintf('刷新仪器地址失败: %s (行号：%d)', ME.message, ME.stack(1).line), 'error');

                % 出错时重置所有下拉框
                errorMsg = {'错误：请检查仪器连接'};
                app.dd_VNA.Items = errorMsg;
                app.dd_TempDev.Items = errorMsg;
                app.dd_Switch.Items = errorMsg;
            end
        end

        % Button pushed function: btn_SaveLog
        function btn_SaveLogButtonPushed(app, event)
            try
                % 1. 获取日志内容
                logContent = app.tt_LogText.Value;
                if isempty(logContent)
                    app.addLog('⚠️ 日志为空，无内容保存。', 'warning');
                    return;
                end

                % 2. 弹出保存对话框
                [file, path] = uiputfile('*.txt', '保存工作日志为TXT文件', ...
                    sprintf('测试日志_%s.txt', datetime('now', 'Format', 'yyyyMMdd_HHmmss')));
                if isequal(file, 0)   % 用户取消
                    return;
                end
                fullPath = fullfile(path, file);

                % 3. 写入TXT文件（每行后加换行符）
                fid = fopen(fullPath, 'w', 'native', 'UTF-8');  % 支持中文
                if fid == -1
                    error('无法创建文件，请检查路径权限。');
                end
                for i = 1:numel(logContent)
                    fprintf(fid, '%s\r\n', logContent{i});  % 保证Windows记事本兼容
                end
                fclose(fid);

                % 4. 反馈成功
                app.addLog(sprintf('✅ 工作日志已保存至: %s', fullPath), 'success');
            catch ME
                if exist('fid', 'var') && ~isempty(fopen(fid))
                    fclose(fid);
                end
                app.addLog(sprintf('❌ 保存日志失败: %s', ME.message), 'error');
            end
        end

        % Value changed function: dd_VNA
        function dd_VNAValueChanged(app, event)
            app.SelectedAddresses.vna = app.dd_VNA.Value;
            app.addLog(sprintf('矢网地址已更新为: %s', app.SelectedAddresses.vna), 'info');
        end

        % Value changed function: dd_TempDev
        function dd_TempDevValueChanged(app, event)
            app.SelectedAddresses.tempDev = app.dd_TempDev.Value;
            app.addLog(sprintf('控温仪地址已更新为: %s', app.SelectedAddresses.tempDev), 'info');
        end

        % Value changed function: dd_Switch
        function dd_SwitchValueChanged(app, event)
            app.SelectedAddresses.switchDev = app.dd_Switch.Value;
            app.addLog(sprintf('同轴开关地址已更新为: %s', app.SelectedAddresses.switchDev), 'info');
        end

        % Button pushed function: btn_VNAConnect
        function btn_VNAConnectButtonPushed(app, event)
            % 检查地址有效性
            selectedAddress = app.SelectedAddresses.vna;
            if strcmp(selectedAddress, '未找到任何可用设备') || strcmp(selectedAddress, '错误：请检查仪器连接')
                app.addLog('请先刷新仪器地址并选择有效地址', 'warning');
                return;
            end

            try
                app.addLog(sprintf('正在连接矢网: %s', selectedAddress), 'info');

                % 完全保留你原有的连接参数
                app.vna = visadev(selectedAddress);
                app.vna.InputBufferSize = 1000000;
                app.vna.Timeout = 30;

                % 查询设备ID验证连接
                flushinput(app.vna);
                fprintf(app.vna, '*IDN?');
                idn = fscanf(app.vna);
                disp(['成功连接矢网: ' idn]);

                % 更新状态显示
                app.lamp_VNA.Color = app.Color_Online;
                app.btn_VNAConnect.Enable = 'off';
                app.btn_VNADisconnect.Enable = 'on';
                app.lbl_VNAStatusText.Text = '已连接';
                app.lbl_VNAStatusText.FontColor = app.Color_Online;

                % 更新全局状态栏
                app.lbl_VNA.Text = '矢网：已连接';
                app.lbl_VNA.FontColor = app.Color_Online;

                % 更新系统状态
                app.addLog(sprintf('矢网连接成功: %s', idn), 'success');

            catch ME
                app.addLog(sprintf('矢网连接失败: %s', ME.message), 'error');

                % 连接失败时清理
                if isfield(app, 'vna') && isvalid(app.vna)
                    delete(app.vna);
                end

                % 重置状态
                app.lamp_VNA.Color = app.Color_Error;
                app.btn_VNAConnect.Enable = 'on';
                app.btn_VNADisconnect.Enable = 'off';
            end
        end

        % Button pushed function: btn_VNADisconnect
        function btn_VNADisconnectButtonPushed(app, event)
            try
                fclose(app.vna);
                delete(app.vna);

                % 更新状态显示
                app.lamp_VNA.Color = app.Color_Offline;
                app.btn_VNAConnect.Enable = 'on';
                app.btn_VNADisconnect.Enable = 'off';
                app.lbl_VNAStatusText.Text = 'Disconnected';
                app.lbl_VNAStatusText.FontColor = app.Color_Offline;

                % 更新全局状态栏
                app.lbl_VNA.Text = 'VNA：Disconnected';
                app.lbl_VNA.FontColor = app.Color_Offline;

                % 更新系统状态
                app.addLog('矢网已断开连接', 'success');

            catch ME
                app.addLog(sprintf('断开矢网失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_TempDevConnect
        function btn_TempDevConnectButtonPushed(app, event)
            % 检查地址有效性
                selectedAddress = app.SelectedAddresses.tempDev;
                if strcmp(selectedAddress, '未找到任何可用设备') || strcmp(selectedAddress, '错误：请检查仪器连接')
                    app.addLog('请先刷新仪器地址并选择有效地址', 'warning');
                    return;
                end

                try
                    app.addLog(sprintf('正在连接控温仪: %s', selectedAddress), 'info');

                    % 完全保留你原有的连接参数
                    app.tempDev = visadev(selectedAddress);
                    app.tempDev.InputBufferSize = 1000000;
                    app.tempDev.Timeout = 30;

                    % 查询设备ID验证连接
                    flushinput(app.tempDev);
                    fprintf(app.tempDev, '*IDN?');
                    idn = fscanf(app.tempDev);
                    disp(['成功连接控温仪: ' idn]);

                    % 更新状态显示
                    app.lamp_TempDev.Color = app.Color_Online;
                    app.btn_TempDevConnect.Enable = 'off';
                    app.btn_TempDevDisconnect.Enable = 'on';
                    app.lbl_TempDevStatusText.Text = '已连接';
                    app.lbl_TempDevStatusText.FontColor = app.Color_Online;

                    % 更新全局状态栏
                    app.lbl_TempDev.Text = '控温仪：已连接';
                    app.lbl_TempDev.FontColor = app.Color_Online;

                    % 更新系统状态
                    app.addLog(sprintf('控温仪连接成功: %s', idn), 'success');

                catch ME
                    app.addLog(sprintf('控温仪连接失败: %s', ME.message), 'error');

                    % 连接失败时清理
                    if isfield(app, 'tempDev') && isvalid(app.tempDev)
                        delete(app.tempDev);
                    end

                    % 重置状态
                    app.lamp_TempDev.Color = app.Color_Error;
                    app.btn_TempDevConnect.Enable = 'on';
                    app.btn_TempDevDisconnect.Enable = 'off';
                end

        end

        % Button pushed function: btn_TempDevDisconnect
        function btn_TempDevDisconnectButtonPushed(app, event)
            try
                    fclose(app.tempDev);
                    delete(app.tempDev);

                % 更新状态显示
                app.lamp_TempDev.Color = app.Color_Offline;
                app.btn_TempDevConnect.Enable = 'on';
                app.btn_TempDevDisconnect.Enable = 'off';
                app.lbl_TempDevStatusText.Text = 'Disconnected';
                app.lbl_TempDevStatusText.FontColor = app.Color_Offline;

                % 更新全局状态栏
                app.lbl_TempDev.Text = 'Temperature Controller：Disconnected';
                app.lbl_TempDev.FontColor = app.Color_Offline;

                % 更新系统状态
                app.addLog('控温仪已断开连接', 'success');

            catch ME
                app.addLog(sprintf('断开控温仪失败: %s', ME.message), 'error');
            end
            visadevlist           % 列出所有当前打开的 visadev
        end

        % Button pushed function: btn_SwitchConnect
        function btn_SwitchConnectButtonPushed(app, event)
           % 连接选定的开发板
            selectedBoard = app.SelectedAddresses.switchDev;

            if isempty(selectedBoard) || strcmp(selectedBoard, 'No serial ports found')
                app.addLog('错误: 请选择有效的开发板%s','error');
                return;
            end

            try
                app.addLog(sprintf('正在连接开发板: %s', selectedBoard),'info');

                % 创建串口连接
                app.switchDev = serialport(selectedBoard, 9600);
                configureTerminator(app.switchDev, "LF");
                app.switchDev.Timeout = 5;

                % 等待Arduino初始化
                pause(2);

                % 检查连接状态
                if app.switchDev.NumBytesAvailable > 0
                    response = readline(app.switchDev);
                    app.addLog(sprintf('开发板响应: %s', strtrim(response)),'info');

                    if contains(response, "READY")
                        app.isConnected = true;
                        app.addLog('开发板连接成功！','info');
                        % 更新状态显示
                        app.lamp_Switch.Color = app.Color_Online;
                        app.btn_SwitchConnect.Enable = 'off';
                        app.btn_SwitchDisconnect.Enable = 'on';
                        app.lbl_SwitchStatusText.Text = '已连接';
                        app.lbl_SwitchStatusText.FontColor = app.Color_Online;
                        app.sw_Switch1.Enable = 'on';
                        app.sw_Switch2.Enable = 'on';
                        app.sw_Switch3.Enable = 'on';
                        app.sw_Switch4.Enable = 'on';

                        % 更新全局状态栏
                        app.lbl_Switch.Text = '同轴开关：已连接';
                        app.lbl_Switch.FontColor = app.Color_Online;
                    else
                        app.addLog('开发板未就绪','error');
                    end
                else
                    app.addLog('开发板无响应','error');
                end

            catch ME
                app.addLog(sprintf('连接失败: %s', ME.message),'error');
                app.lamp_Switch.Color = app.Color_Offline;
                app.btn_SwitchConnect.Enable = 'on';
                app.btn_SwitchDisconnect.Enable = 'off';
                app.lbl_SwitchStatusText.Text = 'Temperature Controller';
                app.lbl_SwitchStatusText.FontColor = app.Color_Offline;
                app.sw_Switch1.Enable = 'off';
                app.sw_Switch2.Enable = 'off';
                app.sw_Switch3.Enable = 'off';
                app.sw_Switch4.Enable = 'off';
                if isvalid(app.switchDev)
                    clear app.switchDev;
                end
                app.isConnected = false;
            end

        end

        % Button pushed function: btn_SwitchDisconnect
        function btn_SwitchDisconnectButtonPushed(app, event)
             % 断开选定的开发板
            selectedBoard = app.SelectedAddresses.switchDev;
            
            if isempty(selectedBoard) || strcmp(selectedBoard, 'No connected devices')
                app.addLog('错误: 请选择要断开的开发板','error');
                return;
            end
            
            try
                if app.isConnected && strcmp(selectedBoard, app.switchDev.Port)
                    % 发送全部关闭命令
                    app.sendCommand('0', '安全关闭');
                    
                    % 关闭连接
                    flush(app.switchDev);

                    clear app.switchDev;
                    app.isConnected = false;
                    
                    % 更新状态显示
                    app.lamp_Switch.Color = app.Color_Offline;
                    app.btn_SwitchConnect.Enable = 'on';
                    app.btn_SwitchDisconnect.Enable = 'off';
                    app.lbl_SwitchStatusText.Text = 'Temperature Controller';
                    app.lbl_SwitchStatusText.FontColor = app.Color_Offline;
                    app.sw_Switch1.Enable = 'off';
                    app.sw_Switch2.Enable = 'off';
                    app.sw_Switch3.Enable = 'off';
                    app.sw_Switch4.Enable = 'off';

                    % 更新全局状态栏
                    app.lbl_Switch.Text = 'Coaxial Switch：Temperature Controller';
                    app.lbl_Switch.FontColor = app.Color_Offline;
                    
                    app.addLog(sprintf('已断开开发板: %s', selectedBoard),'info');
                else
                    app.addLog('错误: 选择的开发板未连接','error');
                end
            catch ME
                app.addLog(sprintf('断开连接时出错: %s', ME.message),'error');
            end
        end

        % Value changed function: sw_Switch1
        function sw_Switch1ValueChanged(app, event)
            value = app.sw_Switch1.Value;
            switch value
                case "On"
                    % 设置通道序列1
                    if app.isConnected
                        app.sendCommand('A','开启同轴开关1通道序列1');
                        app.sendCommand('C','开启同轴开关2通道序列1');% 通道序列1（D2、D4）
                        app.sw_Switch1.FontColor = "green";
                        app.addLog('开关1已设置为通道序列1','info');
                    else
                        app.addLog('错误: 未连接到开发板','error');
                        % 恢复开关状态
                        app.sw_Switch1.FontColor = "black";
                    end
                case "Off"
                    % 关闭通道序列1
                    if app.isConnected
                        app.sendCommand('0', '关闭通道序列1');
                        app.sw_Switch1.FontColor = "black";
                        app.addLog('已关闭通道序列1','info');
                    else
                        app.addLog('错误: 未连接到开发板','error');
                        % 恢复开关状态
                        app.sw_Switch1.FontColor = "green";
                    end
            end
        end

        % Value changed function: sw_Switch2
        function sw_Switch2ValueChanged(app, event)
            value = app.sw_Switch2.Value;
            switch value
                case "On"
                    % 设置通道序列2
                    if app.isConnected
                        app.sendCommand('A','开启同轴开关1通道序列2');
                        app.sendCommand('D','开启同轴开关2通道序列2');% 通道序列2（D2、D5）
                        app.sw_Switch2.FontColor = "green";
                        app.addLog('开关已设置为通道序列2','info');
                    else
                        app.addLog('错误: 未连接到开发板','error');
                        % 恢复开关状态
                        app.sw_Switch2.FontColor = "black";
                    end
                case "Off"
                    % 关闭通道序列2
                    if app.isConnected
                        app.sendCommand('0', '关闭通道序列2');
                        app.sw_Switch2.FontColor = "black";
                        app.addLog('已关闭通道序列2','info');
                    else
                        app.addLog('错误: 未连接到开发板','error');
                        % 恢复开关状态
                        app.sw_Switch2.FontColor = "green";
                    end
            end
        end

        % Value changed function: sw_Switch3
        function sw_Switch3ValueChanged(app, event)
            value = app.sw_Switch3.Value;
            switch value
                case "On"
                    % 设置通道序列3
                    if app.isConnected
                        app.sendCommand('B','开启同轴开关1通道序列3');
                        app.sendCommand('C','开启同轴开关2通道序列3');% 通道序列3（D3、D4）
                        app.sw_Switch3.FontColor = "green";
                        app.addLog('开关已设置为通道序列3','info');
                    else
                        app.addLog('错误: 未连接到开发板','error');
                        % 恢复开关状态
                        app.sw_Switch3.FontColor = "black";
                    end
                case "Off"
                    % 关闭通道序列3
                    if app.isConnected
                        app.sendCommand('0', '关闭通道序列3');
                        app.sw_Switch3.FontColor = "black";
                        app.addLog('已关闭通道序列3','info');
                    else
                        app.addLog('错误: 未连接到开发板','error');
                        % 恢复开关状态
                        app.sw_Switch3.FontColor = "green";
                    end
            end
        end

        % Value changed function: sw_Switch4
        function sw_Switch4ValueChanged(app, event)
            value = app.sw_Switch4.Value;
            switch value
                case "On"
                    % 设置通道序列4
                    if app.isConnected
                        app.sendCommand('B','开启同轴开关1通道序列4');
                        app.sendCommand('D','开启同轴开关2通道序列4');% 通道序列4（D3、D5）
                        app.sw_Switch4.FontColor = "green";
                        app.addLog('开关已设置为通道序列4','info');
                    else
                        app.addLog('错误: 未连接到开发板','error');
                        % 恢复开关状态
                        app.sw_Switch4.FontColor = "black";
                    end
                case "Off"
                    % 关闭通道序列4
                    if app.isConnected
                        app.sendCommand('0', '关闭通道序列4');
                        app.sw_Switch4.FontColor = "black";
                        app.addLog('已关闭通道序列4','info');
                    else
                        app.addLog('错误: 未连接到开发板','error');
                        % 恢复开关状态
                        app.sw_Switch4.FontColor = "green";
                    end
            end
        end

        % Button pushed function: btn_Initialization
        function btn_InitializationButtonPushed(app, event)
            fprintf(app.vna,'SYST:PRES');
            fprintf(app.tempDev,'RANGE 1,0');
            fprintf(app.tempDev,'RAMP 1,1,0');
            fprintf(app.tempDev,'SETP 1,0');
            fprintf(app.vna,'*OPC?');
            respVna=fscanf(app.vna);
            if strtrim(respVna) == "+1"
                app.addLog('矢量网络分析仪初始化完成','success');
            else
                app.addLog(sprintf('矢量网络分析仪初始化失败，收到: "%s"', respVna),'error');
            end
            fprintf(app.tempDev,'*OPC?');
            respTDev = fscanf(app.tempDev);
            if strtrim(respTDev) == "1"   % strtrim 消除前后空白
                app.addLog('控温仪初始化完成', 'success');
            else
                app.addLog(sprintf('控温仪初始化失败，收到: "%s"', respTDev), 'error');
            end
        end

        % Button pushed function: btn_StarFOK
        function btn_StarFOKButtonPushed(app, event)
            try
                if ~isvalid(app.vna)
                    app.addLog('❌ 矢网未连接，无法设置频率', 'error'); return;
                end
                startFreq = app.edt_StartFreq.Value * 1e9;   % GHz → Hz
                fprintf(app.vna, sprintf('SENS:FREQ:STAR %f', startFreq));
                app.addLog(sprintf('起始频率已设为 %.2f GHz', app.edt_StartFreq.Value), 'info');
            catch ME
                app.addLog(sprintf('设置失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_StopFOK
        function btn_StopFOKButtonPushed(app, event)
            try
                if ~isvalid(app.vna)
                    app.addLog('❌ 矢网未连接，无法设置频率', 'error'); return;
                end
                stopFreq = app.edt_StopFreq.Value * 1e9;
                fprintf(app.vna, sprintf('SENS:FREQ:STOP %f', stopFreq));
                app.addLog(sprintf('终止频率已设为 %.2f GHz', app.edt_StopFreq.Value), 'info');
            catch ME
                app.addLog(sprintf('设置失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_CenterFOK
        function btn_CenterFOKButtonPushed(app, event)
            try
                if ~isvalid(app.vna)
                    app.addLog('❌ 矢网未连接，无法设置频率', 'error'); return;
                end
                centerFreq = app.edt_CenterFreq.Value * 1e9;
                span = app.edt_Span.Value * 1e9;
                fprintf(app.vna, sprintf('SENS:FREQ:CENT %f', centerFreq));
                fprintf(app.vna, sprintf('SENS:FREQ:SPAN %f', span));
                % 同步更新起始/终止显示
                app.edt_StartFreq.Value = app.edt_CenterFreq.Value - app.edt_Span.Value/2;
                app.edt_StopFreq.Value  = app.edt_CenterFreq.Value + app.edt_Span.Value/2;
                app.addLog(sprintf('中心频率 %.2f GHz, 跨度 %.2f GHz 已应用', app.edt_CenterFreq.Value, app.edt_Span.Value), 'info');
            catch ME
                app.addLog(sprintf('设置失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_SpanFOK
        function btn_SpanFOKButtonPushed(app, event)
            try
                if ~isvalid(app.vna)
                    app.addLog('❌ 矢网未连接，无法设置频率', 'error'); return;
                end
                span = app.edt_Span.Value * 1e9;
                fprintf(app.vna, sprintf('SENS:FREQ:SPAN %f', span));
                % 一般跨度改变时中心不变，无需重发 CENT，但为保险也可发一次
                % 同步更新起始/终止显示
                app.edt_StartFreq.Value = app.edt_CenterFreq.Value - span/2/1e9;
                app.edt_StopFreq.Value  = app.edt_CenterFreq.Value + span/2/1e9;
                app.addLog(sprintf('频率跨度已设为 %.2f GHz', app.edt_Span.Value), 'info');
            catch ME
                app.addLog(sprintf('设置失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_PointOK
        function btn_PointOKButtonPushed(app, event)
            try
                if ~isvalid(app.vna)
                    app.addLog('❌ 矢网未连接，无法设置点数', 'error'); return;
                end
                points = round(app.edt_Points.Value);
                app.edt_Points.Value = points;
                fprintf(app.vna, sprintf('SENS:SWE:POIN %d', points));
                app.addLog(sprintf('扫描点数已设为 %d', points), 'info');
            catch ME
                app.addLog(sprintf('设置失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_PowerOK
        function btn_PowerOKButtonPushed(app, event)
            try
                if ~isvalid(app.vna)
                    app.addLog('❌ 矢网未连接，无法设置功率', 'error'); return;
                end
                power = app.edt_Power.Value;
                fprintf(app.vna, sprintf('SOUR:POW %f', power));
                app.addLog(sprintf('输出功率已设为 %.1f dBm', power), 'info');
            catch ME
                app.addLog(sprintf('设置失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_IFBandwidthOK
        function btn_IFBandwidthOKButtonPushed(app, event)
            try
                if ~isvalid(app.vna)
                    app.addLog('❌ 矢网未连接，无法设置IF带宽', 'error'); return;
                end
                ifBandwidth = app.edt_IFBandwidth.Value * 1e3;   % kHz → Hz
                fprintf(app.vna, sprintf('SENS:BWID %f', ifBandwidth));
                app.addLog(sprintf('IF带宽已设为 %.3f kHz', app.edt_IFBandwidth.Value), 'info');
            catch ME
                app.addLog(sprintf('设置失败: %s', ME.message), 'error');
            end
        end

        % Value changed function: sw_AverageSW
        function sw_AverageSWValueChanged(app, event)
            try
                if ~isvalid(app.vna)
                    app.addLog('❌ 错误：矢网未连接', 'error');
                    return;
                end

                value = app.sw_AverageSW.Value;
                avgcount = app.edt_AverageCount.Value;
                switch value
                    case "On"
                        % 设置平均次数
                        fprintf(app.vna, 'SENS:AVER:COUN %d', avgcount);
                        % 启用平均功能
                        fprintf(app.vna, 'SENS:AVER:STATe ON');
                        app.addLog('平均已开启', 'info');
                    case "Off"
                        % 关闭平均功能
                        fprintf(app.vna, 'SENS:AVER:STATe OFF');
                        app.addLog('平均已关闭', 'info');
                end
                
            catch ME
                app.addLog(sprintf('❌ 操作失败: %s', ME.message), 'error');
            end
            
        end

        % Button pushed function: btn_SelectSavePath
        function btn_SelectSavePathButtonPushed(app, event)
            try
                selectedPath = uigetdir(app.dataSavePath, '选择数据保存文件夹');
                if selectedPath ~= 0
                    app.dataSavePath = selectedPath;
                    app.lbl_CurrentPath.Text = ['当前路径: ' selectedPath];
                    app.addLog(sprintf('数据保存路径已设置: %s', selectedPath), 'info');
                end
            catch ME
                app.addLog(sprintf('选择路径失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_Autoscale
        function btn_AutoscaleButtonPushed(app, event)
            try
                if ~isvalid(app.vna)
                    app.addLog('❌ 错误：矢网未连接', 'error');
                    return;
                end

                fprintf(app.vna, 'DISP:WIND:TRAC:Y:SCAL:AUTO');
                app.addLog('矢网曲线已自动缩放', 'info');
            catch ME
                app.addLog(sprintf('❌ 操作失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_MarkertoCenter
        function btn_MarkertoCenterButtonPushed(app, event)
            try
                if ~isvalid(app.vna)
                    app.addLog('❌ 错误：矢网未连接', 'error');
                    return;
                end

                fprintf(app.vna, 'CALC:MEAS:MARK:SET CENT');
                app.addLog('Marker已居中到S21峰值', 'info');
            catch ME
                app.addLog(sprintf('❌ 操作失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_3dBBWSearch
        function btn_3dBBWSearchButtonPushed(app, event)
            try
                if ~isvalid(app.vna)
                    app.addLog('❌ 错误：矢网未连接', 'error');
                    return;
                end
                fprintf(app.vna, 'CALC:MEAS:MARK:BWID ON');
                flushinput(app.vna);
                fprintf(app.vna, 'CALC:MEAS:MARK:BWID:DATA?');
                resp = fscanf(app.vna);

                if isempty(resp)
                    error('未收到仪器返回数据。');
                end
                data = sscanf(resp, '%f,', [1, 4]);

                if numel(data) ~= 4
                    tmp = strsplit(strtrim(resp), ',');
                    data = str2double(tmp);
                    if numel(data) ~= 4
                        error('未能解析出4个数值，返回字符串: %s', resp);
                    end
                end

                bandwidth = data(1);
                app.addLog(sprintf('测得-3dB带宽: %.6f MHz\n', bandwidth / 1e6), 'info');
            catch ME
                app.addLog(sprintf('❌ 带宽搜索失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_MarkerOFF
        function btn_MarkerOFFButtonPushed(app, event)
            try
                if ~isvalid(app.vna)
                    app.addLog('错误：矢网未连接', 'error');
                    return;
                end

                fprintf(app.vna, 'CALC:MEAS:MARK:AOFF');
                app.addLog('Marker已关闭', 'info');
            catch ME
                app.addLog(sprintf('操作失败: %s', ME.message), 'error');
            end
        end

        % Value changed function: dd_Sparam
        function dd_SparamValueChanged(app, event)
            try
                if isempty(app.vna) || ~isvalid(app.vna)
                    app.addLog('❌ 矢网未连接', 'error');
                    return;
                end
                sParam = app.dd_Sparam.Value;   % "S11","S21","S12","S22"
                fprintf(app.vna, sprintf('CALCulate:MEASure1:PARameter %s', sParam));
                app.addLog(sprintf('🔀 已切换至 %s', sParam), 'info');
            catch ME
                app.addLog(sprintf('切换失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_StartTest
        function btn_StartTestButtonPushed(app, event)
            % 停止外部监视定时器（如果正在运行）
            stopTempMonitor(app);
            try
                app.addLog('正在初始化变温测试...', 'info');

                % ========== 1. 仪器连接检查（复用全局对象） ==========
                if ~isvalid(app.vna)
                    app.addLog('错误：矢网未连接，请先在主页面连接仪器', 'error');
                    return;
                end
                if ~isvalid(app.tempDev)
                    app.addLog('错误：控温仪未连接，请先在主页面连接仪器', 'error');
                    return;
                end

                % ========== 2. 从界面读取所有参数 ==========
                sampleName = strtrim(app.edt_SampleName.Value);
                rampRate = app.edt_RampRate.Value;
                targetTemp = app.edt_TargetTemp.Value;
                saveInterval = app.edt_SaveInterval.Value;

                % ========== 3. 参数合法性检查 ==========
                if isempty(sampleName)
                    app.addLog('错误：请输入样品名称', 'error');
                    return;
                end
                if saveInterval <= 0
                    app.addLog('错误：保存间隔必须大于0 K', 'error');
                    return;
                end
                if targetTemp <= 0
                    app.addLog('错误：目标温度必须高于0 K', 'error');
                    return;
                end

                % ========== 4. 初始化测试状态 ==========
                app.isEmergencyStop = false;
                app.isTestRunning = true;
                app.isTestPaused = false;
                app.isStabilizing = false;
                app.currentSavePoint = 0;

                % 读取当前温度作为起始温度
                currentTemp = readAllTemperatures(app);
                app.finalTargetTemp = targetTemp; % 保存最终目标温度

                % ✅ 生成绝对温度目标点队列（零累积误差核心）
                app.targetTempPoints = unique([currentTemp.sample : saveInterval : targetTemp, targetTemp]);
                app.totalSavePoints = length(app.targetTempPoints);
                app.nextTargetIndex = 1; % 从第一个目标点开始

                app.testStartTime = tic;

                % 清空历史数据和曲线
                app.timeArray = [];
                app.sampleTempArray = [];
                app.sampleHeadTempArray = [];
                app.resonatorTempArray = [];
                app.resonatorHeadTempArray = [];

                cla(app.ax_TempCurve);
                hold(app.ax_TempCurve, 'on');
                grid(app.ax_TempCurve, 'on');

                % 创建高性能曲线对象（整个测试只创建一次）
                app.hTempLine = plot(app.ax_TempCurve, NaN, NaN, ...
                    'r.-', 'LineWidth', 1.5, 'MarkerSize', 6);

                % 更新按钮状态
                app.btn_StartTest.Enable = 'off';
                app.btn_PauseTest.Enable = 'on';
                app.btn_StopTest.Enable = 'on';

                % ========== 6. 启动控温仪 ==========
                fprintf(app.tempDev, sprintf('RAMP 1,%f', rampRate));
                fprintf(app.tempDev, sprintf('SETP 1,%f', targetTemp));
                fprintf(app.tempDev, 'RANGE 1,1');

                app.addLog(sprintf('控温仪已启动：斜坡速率%.1f K/min，目标温度%.1f K', rampRate, targetTemp), 'success');
                app.addLog(sprintf('📝 测试配置：样品=%s，保存间隔=%.1f K', sampleName, saveInterval), 'info');
                app.addLog(sprintf('📊 预计保存数据点数量：%d 个', app.totalSavePoints), 'info');

                % ========== 7. 启动1秒主循环定时器 ==========
                app.testTimer = timer(...
                    'Period', 1, ...
                    'ExecutionMode', 'fixedRate', ...
                    'TimerFcn', @(src, event) testMainLoop(app), ...
                    'StopFcn', @(src, event) testCleanup(app));

                start(app.testTimer);

            catch ME
                app.addLog(sprintf('启动测试失败: %s', ME.message), 'error');
                app.isTestRunning = false;
            end
        end

        % Button pushed function: btn_EmergencyStop
        function btn_EmergencyStopButtonPushed(app, event)
            % 设置急停标志（最高优先级，让任何正在执行的循环尽快退出）
            app.isEmergencyStop = true;
            app.isTestRunning = false;   % 同时关闭运行状态
            app.addLog('🚨 紧急停止', 'error');

            % ---------- 立即尝试关闭加热 ----------
            try
                fprintf(app.tempDev, 'RANGE 1,0'); % 直接关闭加热
                fprintf(app.tempDev, '*OPC?');

                app.addLog('🔥 已发送加热关闭指令', 'warning');
            catch
                app.addLog('❌ 关闭加热指令发送失败，请手动检查控温仪！', 'error');
            end

            % ---------- 停止并删除定时器 ----------
            try
                if ~isempty(app.testTimer) && isvalid(app.testTimer)
                    stop(app.testTimer);
                    delete(app.testTimer);
                    app.testTimer = [];
                end
            catch
            end

            % ---------- 重置界面状态 ----------
            app.btn_StartTest.Enable = 'on';
            app.btn_PauseTest.Enable = 'off';
            app.btn_PauseTest.Text = '暂停';
            app.btn_StopTest.Enable = 'off';

            % 清除稳定状态
            app.isStabilizing = false;

            app.addLog('🛑 急停完成：加热已关闭，测试已终止，界面已解锁。', 'warning');
        end

        % Button pushed function: btn_PauseTest
        function btn_PauseTestButtonPushed(app, event)
            if app.isTestPaused
                % ========== 继续测试 ==========
                app.isTestPaused = false;
                app.btn_PauseTest.Text = '暂停';

                % 停止监视定时器（因为主循环要恢复刷新了）
                stopTempMonitor(app);

                % 读取当前温度（用于日志和设置）
                flushinput(app.tempDev);
                fprintf(app.tempDev, 'KRDG A?');
                CurrentTemp = fscanf(app.tempDev);
                % 恢复加热到最终目标温度
                fprintf(app.tempDev, sprintf('SETP A,%.3f', app.finalTargetTemp));
                app.addLog(sprintf('▶️ 测试已继续，当前温度：%.3f K', CurrentTemp), 'info');
            else
                % ========== 暂停测试 ==========
                app.isTestPaused = true;
                app.btn_PauseTest.Text = '继续';

                % 读取当前温度（日志用）
                flushinput(app.tempDev);
                fprintf(app.tempDev, 'KRDG A?');
                CurrentTemp = fscanf(app.tempDev);
                % 保持当前温度（暂停升温）
                fprintf(app.tempDev, sprintf('SETP A,%.3f', CurrentTemp));
                app.addLog(sprintf('⏸️ 测试已暂停，当前温度：%.3f K', CurrentTemp), 'info');

                % 启动监视定时器，保持温度显示更新
                startTempMonitor(app);
            end
        end

        % Button pushed function: btn_StopTest
        function btn_StopTestButtonPushed(app, event)
            app.addLog('⚠️ 用户手动停止测试', 'warning');
            stop(app.testTimer);  % 会触发 StopFcn -> testCleanup

            % 启动外部监视定时器，使温度显示继续刷新
            startTempMonitor(app);
        end

        % Button pushed function: btn_ExportTempExcel
        function btn_ExportTempExcelButtonPushed(app, event)
            try
                % 检查是否有数据
                if isempty(app.timeArray) || isempty(app.sampleTempArray)
                    app.addLog('⚠️ 没有温度数据，无法导出', 'warning');
                    return;
                end

                % 生成文件名：样品名_温度数据_时间戳.xlsx
                sampleName = strtrim(app.edt_SampleName.Value);
                timestamp = char(datetime('now', 'Format', 'yyyyMMdd_HHmmss'));
                fileName = sprintf('%s_温度数据_%s.xlsx', sampleName, timestamp);
                fullPath = fullfile(app.dataSavePath, fileName);

                % 构建表格（5列原始数据）
                T = table(...
                    app.timeArray(:), ...
                    app.sampleTempArray(:), ...
                    app.sampleHeadTempArray(:), ...
                    app.resonatorTempArray(:), ...
                    app.resonatorHeadTempArray(:), ...
                    'VariableNames', {...
                    'Time_min', ...
                    'Sample_K', ...
                    'SampleHead_K', ...
                    'Resonator_K', ...
                    'ResonatorHead_K' ...
                    });

                % 写入 Excel
                writetable(T, fullPath);

                app.addLog(sprintf('✅ 温度原始数据已保存: %s', fileName), 'success');

            catch ME
                app.addLog(sprintf('❌ 导出Excel失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_SelectSingleFile
        function btn_SelectSingleFileButtonPushed(app, event)
            try
                [fileName, pathName] = uigetfile('*.s2p', '选择单个S2P文件');
                if fileName == 0
                    return;
                end
                fullPath = fullfile(pathName, fileName);
                app.addLog(sprintf('正在拟合单个文件: %s', fileName), 'info');

                % 拟合（接收新增的裁剪数据和参数向量）
                [temp_K, f0_GHz, QL, Q0, beta, sigma_res, ...
                    F_used, D_used, mv] = app.fitSingleS2P(fullPath);

                % ===== 绘制复平面拟合图到 ax_Upper =====
                cla(app.ax_Upper);
                cla(app.ax_Lower);
                
                % 重置坐标轴为自动模式（清除之前单文件/双文件的 manual 设置）
                app.ax_Upper.XLimMode = 'auto';
                app.ax_Upper.YLimMode = 'auto';
                app.ax_Upper.DataAspectRatioMode = 'auto';
                app.ax_Upper.PlotBoxAspectRatioMode = 'auto';

                % 重置坐标轴为自动模式（清除之前单文件/双文件的 manual 设置）
                app.ax_Lower.XLimMode = 'auto';
                app.ax_Lower.YLimMode = 'auto';
                app.ax_Lower.DataAspectRatioMode = 'auto';
                app.ax_Lower.PlotBoxAspectRatioMode = 'auto';

                hold(app.ax_Upper, 'on');
                grid(app.ax_Upper, 'on');

                % 全频原始数据（灰色小点，作为背景）
                [~, D_all] = app.readS2PFile(fullPath);
                plot(app.ax_Upper, real(D_all), imag(D_all), '.', ...
                    'Color', [0.7 0.7 0.7], 'MarkerSize', 2, ...
                    'DisplayName', '全频数据');

                % 用于拟合的裁剪数据（蓝色）
                plot(app.ax_Upper, real(D_used), imag(D_used), 'b.', ...
                    'MarkerSize', 6, 'DisplayName', '拟合数据');

                % 生成拟合模型曲线（红色圆）
                m1 = mv(1); m2 = mv(2); m3 = mv(3); m4 = mv(4);
                QL_fit = mv(5); FL_fit = mv(6);
                Flwst = F_used(1);
                m6 = Flwst * QL_fit / FL_fit;
                F_smooth = linspace(min(F_used), max(F_used), 500);
                S21_smooth = zeros(1,500);
                for i = 1:500
                    y = 1.0 / (1.0 + 2j * (m6 * F_smooth(i)/Flwst - QL_fit));
                    S21_smooth(i) = (m1 + 1j*m2) + (m3 + 1j*m4) * y;
                end
                plot(app.ax_Upper, real(S21_smooth), imag(S21_smooth), 'r-', ...
                    'LineWidth', 2, 'DisplayName', '拟合曲线');

                % 标注谐振点（y=1 时的 S21）
                S21_res = (m1 + 1j*m2) + (m3 + 1j*m4);
                plot(app.ax_Upper, real(S21_res), imag(S21_res), 'ro', ...
                    'MarkerSize', 10, 'LineWidth', 1.5, 'DisplayName', '谐振点');

                % ---- 关键：保持坐标轴原始大小，手动设置正方形数据范围 ----
                x_data = real(D_used);
                y_data = imag(D_used);
                x_center = (max(x_data) + min(x_data)) / 2;
                y_center = (max(y_data) + min(y_data)) / 2;
                % 取数据最大跨度，并留出 10% 边距
                half_span = 1.1 * max(max(x_data)-min(x_data), max(y_data)-min(y_data)) / 2;
                xlim(app.ax_Upper, [x_center - half_span, x_center + half_span]);
                ylim(app.ax_Upper, [y_center - half_span, y_center + half_span]);
                % 启用等比例显示，但不使用 tight 或 square，保持坐标轴物理尺寸不变
                axis(app.ax_Upper, 'equal');

                xlabel(app.ax_Upper, '实部');
                ylabel(app.ax_Upper, '虚部');
                title(app.ax_Upper, sprintf('复平面拟合 T=%.1fK | Q_L=%.0f | Q_0=%.0f', ...
                    temp_K, QL, Q0));
                legend(app.ax_Upper, 'Location', 'best');

                % （可选）在 ax_Lower 显示幅频曲线或留空
                cla(app.ax_Lower);
                hold(app.ax_Lower, 'on'); grid(app.ax_Lower, 'on');
                % 幅频曲线
                S21_mag_smooth = abs(S21_smooth);
                plot(app.ax_Lower, F_smooth, 20*log10(S21_mag_smooth), 'r-', 'LineWidth', 1.5);
                xlabel(app.ax_Lower, '频率 (GHz)');
                ylabel(app.ax_Lower, '|S21| (dB)');

                app.addLog(sprintf('✅ 拟合完成 | f0=%.4f GHz | Q0=%d | β=%.2f | σ=%.2e', ...
                    f0_GHz, Q0, beta, sigma_res), 'success');

            catch ME
                app.addLog(sprintf('❌ 单文件拟合失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_SelectCompareFiles
        function btn_SelectCompareFilesButtonPushed(app, event)
            try
                app.addLog('=== 双文件拟合对比（复平面图）===', 'info');

                % --- 文件1 → 显示在 ax_Upper ---
                [file1, path1] = uigetfile('*.s2p', '选择第一个 S2P 文件');
                if file1 == 0
                    app.addLog('已取消选择', 'warning');
                    return;
                end
                fullPath1 = fullfile(path1, file1);
                [T1, ~, QL1, Q01, ~, ~, F1, D1, mv1] = app.fitSingleS2P(fullPath1);

                cla(app.ax_Upper);
                hold(app.ax_Upper, 'on'); grid(app.ax_Upper, 'on');
                % 全频数据（灰色）
                [~, D_all1] = app.readS2PFile(fullPath1);
                plot(app.ax_Upper, real(D_all1), imag(D_all1), '.', ...
                    'Color', [0.7 0.7 0.7], 'MarkerSize', 2, 'DisplayName', '全频数据');
                % 裁剪数据（蓝色）
                plot(app.ax_Upper, real(D1), imag(D1), 'b.', ...
                    'MarkerSize', 4, 'DisplayName', '文件1数据');
                % 拟合圆
                m1=mv1(1); m2=mv1(2); m3=mv1(3); m4=mv1(4);
                QLf=mv1(5); FLf=mv1(6); Flwst=F1(1); m6=Flwst*QLf/FLf;
                Fs = linspace(min(F1), max(F1), 500);
                S21s = zeros(1,500);
                for i=1:500
                    y = 1.0/(1.0+2j*(m6*Fs(i)/Flwst - QLf));
                    S21s(i) = (m1+1j*m2)+(m3+1j*m4)*y;
                end
                plot(app.ax_Upper, real(S21s), imag(S21s), 'r-', 'LineWidth',1.5,'DisplayName','拟合圆');
                % 谐振点
                S21res = (m1+1j*m2)+(m3+1j*m4);
                plot(app.ax_Upper, real(S21res), imag(S21res), 'ro','MarkerSize',8,'DisplayName','谐振点');
                % 轴设置
                xd=real(D1); yd=imag(D1);
                xc=(max(xd)+min(xd))/2; yc=(max(yd)+min(yd))/2;
                hs=1.1*max(max(xd)-min(xd), max(yd)-min(yd))/2;
                xlim(app.ax_Upper,[xc-hs xc+hs]); ylim(app.ax_Upper,[yc-hs yc+hs]);
                axis(app.ax_Upper,'equal');
                xlabel(app.ax_Upper,'实部'); ylabel(app.ax_Upper,'虚部');
                title(app.ax_Upper, sprintf('文件1: %.1f K | Q_L=%.0f | Q_0=%.0f', T1, QL1, Q01));
                legend(app.ax_Upper,'Location','best');

                % --- 文件2 → 显示在 ax_Lower ---
                [file2, path2] = uigetfile('*.s2p', '选择第二个 S2P 文件');
                if file2 == 0
                    app.addLog('已取消选择', 'warning');
                    return;
                end
                fullPath2 = fullfile(path2, file2);
                [T2, ~, QL2, Q02, ~, ~, F2, D2, mv2] = app.fitSingleS2P(fullPath2);

                cla(app.ax_Lower);
                hold(app.ax_Lower, 'on'); grid(app.ax_Lower, 'on');
                [~, D_all2] = app.readS2PFile(fullPath2);
                plot(app.ax_Lower, real(D_all2), imag(D_all2), '.', ...
                    'Color', [0.7 0.7 0.7], 'MarkerSize', 2, 'DisplayName', '全频数据');
                plot(app.ax_Lower, real(D2), imag(D2), 'b.', ...
                    'MarkerSize', 4, 'DisplayName', '文件2数据');
                m1=mv2(1); m2=mv2(2); m3=mv2(3); m4=mv2(4);
                QLf=mv2(5); FLf=mv2(6); Flwst=F2(1); m6=Flwst*QLf/FLf;
                Fs = linspace(min(F2), max(F2), 500);
                S21s = zeros(1,500);
                for i=1:500
                    y = 1.0/(1.0+2j*(m6*Fs(i)/Flwst - QLf));
                    S21s(i) = (m1+1j*m2)+(m3+1j*m4)*y;
                end
                plot(app.ax_Lower, real(S21s), imag(S21s), 'r-', 'LineWidth',1.5,'DisplayName','拟合圆');
                S21res = (m1+1j*m2)+(m3+1j*m4);
                plot(app.ax_Lower, real(S21res), imag(S21res), 'ro','MarkerSize',8,'DisplayName','谐振点');
                xd=real(D2); yd=imag(D2);
                xc=(max(xd)+min(xd))/2; yc=(max(yd)+min(yd))/2;
                hs=1.1*max(max(xd)-min(xd), max(yd)-min(yd))/2;
                xlim(app.ax_Lower,[xc-hs xc+hs]); ylim(app.ax_Lower,[yc-hs yc+hs]);
                axis(app.ax_Lower,'equal');
                xlabel(app.ax_Lower,'实部'); ylabel(app.ax_Lower,'虚部');
                title(app.ax_Lower, sprintf('文件2: %.1f K | Q_L=%.0f | Q_0=%.0f', T2, QL2, Q02));
                legend(app.ax_Lower,'Location','best');

                app.addLog('🎉 双文件显示完成：右上 = 文件1，右下 = 文件2', 'success');
            catch ME
                app.addLog(['❌ 双文件对比失败：' ME.message], 'error');
            end
        end

        % Button pushed function: btn_SelectBatchFolder
        function btn_SelectBatchFolderButtonPushed(app, event)
            try
                folderPath = uigetdir(pwd, '选择包含S2P文件的文件夹');
                if folderPath == 0
                    return;
                end

                % 清空上一次的文件列表
                app.batchFileList = [];
                app.batchFitResults = [];

                app.addLog('========================================', 'info');
                app.addLog(sprintf('正在扫描文件夹: %s', folderPath), 'info');

                % 获取文件夹内所有.s2p文件
                fileList = dir(fullfile(folderPath, '*.s2p'));
                if isempty(fileList)
                    app.addLog('❌ 文件夹内未找到任何S2P文件', 'error');
                    return;
                end

                app.batchFileList = fileList;
                totalFiles = length(fileList);

                app.addLog(sprintf('✅ 找到 %d 个S2P文件，待处理列表如下：', totalFiles), 'success');
                app.addLog('----------------------------------------', 'info');

                % 逐个解析文件名并显示温度（不做拟合）
                validCount = 0;
                for i = 1:totalFiles
                    fileName = fileList(i).name;
                    % 从文件名提取温度
                    tokens = regexp(fileName, '_(\d+\.?\d*)K\.s2p', 'tokens');
                    if isempty(tokens)
                        app.addLog(sprintf('⚠️  [%d/%d] %s → 无法解析温度，将被跳过', i, totalFiles, fileName), 'warning');
                        continue;
                    end
                    temp = str2double(tokens{1}{1});
                    app.addLog(sprintf('    [%d/%d] %s → 温度: %.1f K', i, totalFiles, fileName, temp), 'info');
                    validCount = validCount + 1;
                end

                app.addLog('----------------------------------------', 'info');
                app.addLog(sprintf('✅ 扫描完成：共 %d 个有效文件，%d 个无效文件', validCount, totalFiles-validCount), 'success');
                app.addLog('确认无误后，请点击【开始处理】按钮进行批量拟合', 'info');
                app.addLog('========================================', 'info');

            catch ME
                app.addLog(sprintf('❌ 选择文件夹失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_ProcessData
        function btn_ProcessDataButtonPushed(app, event)
            try
                if isempty(app.batchFileList)
                    app.addLog('❌ 请先点击【选择文件夹批量处理】选择待处理文件', 'error');
                    return;
                end

                app.addLog('========================================', 'info');
                app.addLog('开始批量拟合处理...', 'info');
                app.batchFitResults = [];
                totalFiles = length(app.batchFileList);
                successCount = 0;

                for i = 1:totalFiles
                    fileName = app.batchFileList(i).name;
                    fullPath = fullfile(app.batchFileList(i).folder, fileName);

                    try
                        % 调用统一拟合接口
                        [temp_K, f0_GHz, QL, Q0, beta, sigma_res, ~, ~, ~] = app.fitSingleS2P(fullPath);

                        % 保存结果
                        app.batchFitResults(end+1, :) = [temp_K, f0_GHz, QL, Q0, beta, sigma_res];
                        app.addLog(sprintf('[%d/%d] ✅ 处理完成: %s | T=%.1fK | Q0=%d', ...
                            i, totalFiles, fileName, temp_K, Q0), 'success');
                        successCount = successCount + 1;
                    catch ME
                        app.addLog(sprintf('[%d/%d] ❌ 处理失败: %s → %s', ...
                            i, totalFiles, fileName, ME.message), 'error');
                    end
                end

                % 按温度排序
                app.batchFitResults = sortrows(app.batchFitResults, 1);

                % 绘制结果曲线
                if ~isempty(app.batchFitResults)
                    cla(app.ax_Upper);
                    cla(app.ax_Lower);
                    % 重置坐标轴为自动模式（清除之前单文件/双文件的 manual 设置）
                    app.ax_Upper.XLimMode = 'auto';
                    app.ax_Upper.YLimMode = 'auto';
                    app.ax_Upper.DataAspectRatioMode = 'auto';
                    app.ax_Upper.PlotBoxAspectRatioMode = 'auto';

                    % 重置坐标轴为自动模式（清除之前单文件/双文件的 manual 设置）
                    app.ax_Lower.XLimMode = 'auto';
                    app.ax_Lower.YLimMode = 'auto';
                    app.ax_Lower.DataAspectRatioMode = 'auto';
                    app.ax_Lower.PlotBoxAspectRatioMode = 'auto';

                    hold(app.ax_Upper, 'on');
                    plot(app.ax_Upper, app.batchFitResults(:,1), app.batchFitResults(:,4), 'b.-', 'LineWidth', 1.5, 'MarkerSize', 6);
                    xlabel(app.ax_Upper, '温度 (K)');
                    ylabel(app.ax_Upper, '无载Q值');
                    title(app.ax_Upper, 'Q-T曲线');
                    grid(app.ax_Upper, 'on');
                    axis(app.ax_Upper, 'auto');      % ← 加入这一行

                    hold(app.ax_Lower, 'on');
                    plot(app.ax_Lower, app.batchFitResults(:,1), app.batchFitResults(:,6), 'r.-', 'LineWidth', 1.5, 'MarkerSize', 6);
                    xlabel(app.ax_Lower, '温度 (K)');
                    ylabel(app.ax_Lower, '残差标准差 σ');
                    title(app.ax_Lower, '拟合残差-T曲线');
                    grid(app.ax_Lower, 'on');
                    axis(app.ax_Lower, 'auto');      % ← 加入这一行
                end

                app.addLog('========================================', 'info');
                app.addLog(sprintf('🎉 批量处理完成！成功: %d 个，失败: %d 个', successCount, totalFiles-successCount), 'success');
                app.addLog('========================================', 'info');

            catch ME
                app.addLog(sprintf('❌ 批量处理失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_ExportFitData
        function btn_ExportFitDataButtonPushed(app, event)
            try
                if isempty(app.batchFitResults)
                    app.addLog('❌ 没有可导出的拟合数据', 'error');
                    return;
                end

                % 导出拟合数据
                [fileName, pathName] = uiputfile('*.xlsx', '导出拟合数据', ...
                    sprintf('批量拟合结果_%s.xlsx', char(datetime('now', 'Format', 'yyyyMMdd_HHmmss'))));
                if fileName == 0
                    return;
                end

                fullPath = fullfile(pathName, fileName);
                T = table(...
                    app.batchFitResults(:,1), ...
                    app.batchFitResults(:,2), ...
                    app.batchFitResults(:,3), ...
                    app.batchFitResults(:,4), ...
                    app.batchFitResults(:,5), ...
                    app.batchFitResults(:,6), ...
                    'VariableNames', {'温度_K', '频率_GHz', '有载Q', '无载Q', '耦合系数β', '残差标准差σ'});

                writetable(T, fullPath);
                app.addLog(sprintf('✅ 拟合数据已导出到: %s', fullPath), 'success');

            catch ME
                app.addLog(sprintf('❌ 导出失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_SelectCavityFolder
        function btn_SelectCavityFolderButtonPushed(app, event)
            try
                folderPath = uigetdir(pwd, '选择空腔测试数据文件夹');
                if folderPath == 0
                    return;
                end

                fileList = dir(fullfile(folderPath, '*.s2p'));
                if isempty(fileList)
                    app.addLog('❌ 空腔文件夹内未找到S2P文件', 'error');
                    return;
                end

                app.addLog('正在拟合空腔数据...', 'info');
                app.cavityFitData = [];

                for i = 1:length(fileList)
                    fileName = fileList(i).name;
                    fullPath = fullfile(fileList(i).folder, fileName);

                    try
                        [temp_K, f0_GHz, QL, Q0, beta, sigma_res, ~, ~, ~] = app.fitSingleS2P(fullPath);
                        app.cavityFitData(end+1, :) = [temp_K, f0_GHz, QL, Q0, beta, sigma_res];
                        app.addLog(sprintf('[%d/%d] 空腔文件处理完成: %.1fK', i, length(fileList), temp_K), 'info');
                    catch ME
                        app.addLog(sprintf('⚠️ 跳过空腔文件 %s: %s', fileName, ME.message), 'warning');
                    end
                end

                % 按温度排序
                app.cavityFitData = sortrows(app.cavityFitData, 1);
                app.addLog(sprintf('✅ 空腔数据拟合完成，共 %d 个温度点', size(app.cavityFitData, 1)), 'success');

            catch ME
                app.addLog(sprintf('❌ 空腔数据处理失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_SelectSampleFolder
        function btn_SelectSampleFolderButtonPushed(app, event)
            try
                folderPath = uigetdir(pwd, '选择样品测试数据文件夹');
                if folderPath == 0
                    return;
                end

                fileList = dir(fullfile(folderPath, '*.s2p'));
                if isempty(fileList)
                    app.addLog('❌ 样品文件夹内未找到S2P文件', 'error');
                    return;
                end

                app.addLog('正在拟合样品数据...', 'info');
                app.sampleFitData = [];

                for i = 1:length(fileList)
                    fileName = fileList(i).name;
                    fullPath = fullfile(fileList(i).folder, fileName);

                    try
                        [temp_K, f0_GHz, QL, Q0, beta, sigma_res, ~, ~, ~] = app.fitSingleS2P(fullPath);
                        app.sampleFitData(end+1, :) = [temp_K, f0_GHz, QL, Q0, beta, sigma_res];
                        app.addLog(sprintf('[%d/%d] 样品文件处理完成: %.1fK', i, length(fileList), temp_K), 'info');
                    catch ME
                        app.addLog(sprintf('⚠️ 跳过样品文件 %s: %s', fileName, ME.message), 'warning');
                    end
                end

                % 按温度排序
                app.sampleFitData = sortrows(app.sampleFitData, 1);
                app.addLog(sprintf('✅ 样品数据拟合完成，共 %d 个温度点', size(app.sampleFitData, 1)), 'success');

            catch ME
                app.addLog(sprintf('❌ 样品数据处理失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_CalculateRs
        function btn_CalculateRsButtonPushed(app, event)
            try
                if isempty(app.cavityFitData) || isempty(app.sampleFitData)
                    app.addLog('❌ 请先导入并拟合空腔和样品数据', 'error');
                    return;
                end

                G = app.edt_GeometryFactor.Value;
                if G <= 0
                    app.addLog('❌ 几何因子必须大于0', 'error');
                    return;
                end

                % 检查数据点数量匹配
                n_points = min(size(app.cavityFitData, 1), size(app.sampleFitData, 1));
                if n_points == 0
                    app.addLog('❌ 没有匹配的数据点', 'error');
                    return;
                end

                app.addLog('正在计算表面电阻...', 'info');
                app.rsResults = [];

                % 直接按索引一一对应
                for i = 1:n_points
                    sampleTemp = app.sampleFitData(i, 1);
                    sampleQ0 = app.sampleFitData(i, 4);
                    sampleBeta = app.sampleFitData(i, 5); % 样品的耦合系数
                    cavityQ0 = app.cavityFitData(i, 4);

                    % 修正后的表面电阻公式
                    Rs = G * (1 + sampleBeta) * (1/sampleQ0 - 1/cavityQ0);
                    app.rsResults(end+1, :) = [sampleTemp, Rs];
                end

                % 绘制Rs-T曲线
                cla(app.ax_Upper);
                % 重置坐标轴为自动模式（清除之前单文件/双文件的 manual 设置）
                app.ax_Upper.XLimMode = 'auto';
                app.ax_Upper.YLimMode = 'auto';
                app.ax_Upper.DataAspectRatioMode = 'auto';
                app.ax_Upper.PlotBoxAspectRatioMode = 'auto';

                hold(app.ax_Upper, 'on'); grid(app.ax_Upper, 'on');
                plot(app.ax_Upper, app.rsResults(:,1), app.rsResults(:,2), 'g.-', 'LineWidth', 1.5, 'MarkerSize', 6);
                xlabel(app.ax_Upper, '温度 (K)');
                ylabel(app.ax_Upper, '表面电阻 (Ω)');
                title(app.ax_Upper, 'Rs-T曲线');
                axis(app.ax_Upper, 'auto');      % ← 加入这一行
                app.addLog(sprintf('✅ 表面电阻计算完成，共 %d 个温度点', size(app.rsResults, 1)), 'success');

            catch ME
                app.addLog(sprintf('❌ 表面电阻计算失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_ExportRsData
        function btn_ExportRsDataButtonPushed(app, event)
            try
                if isempty(app.rsResults)
                    app.addLog('❌ 没有可导出的表面电阻数据', 'error');
                    return;
                end

                % 导出表面电阻数据
                [fileName, pathName] = uiputfile('*.xlsx', '导出表面电阻数据', ...
                    sprintf('表面电阻结果_%s.xlsx', char(datetime('now', 'Format', 'yyyyMMdd_HHmmss'))));
                if fileName == 0
                    return;
                end

                fullPath = fullfile(pathName, fileName);
                T = table(...
                    app.rsResults(:,1), ...
                    app.rsResults(:,2), ...
                    'VariableNames', {'温度_K', '表面电阻_Ω'});

                writetable(T, fullPath);
                app.addLog(sprintf('✅ 表面电阻数据已导出到: %s', fullPath), 'success');

            catch ME
                app.addLog(sprintf('❌ 导出失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_Calculatedielectric
        function btn_CalculatedielectricButtonPushed(app, event)
            try
                if isempty(app.cavityFitData) || isempty(app.sampleFitData)
                    app.addLog('❌ 请先导入并拟合空腔和样品数据', 'error');
                    return;
                end

                A = app.edt_CalA.Value;
                B = app.edt_CalB.Value;
                if A <= 0 || B <= 0
                    app.addLog('❌ 标定常数A和B必须大于0', 'error');
                    return;
                end

                % 检查数据点数量匹配
                n_points = min(size(app.cavityFitData, 1), size(app.sampleFitData, 1));
                if n_points == 0
                    app.addLog('❌ 没有匹配的数据点', 'error');
                    return;
                end

                app.addLog('正在计算介电常数...', 'info');
                app.epsilonResults = [];

                % 直接按索引一一对应
                for i = 1:n_points
                    sampleTemp = app.sampleFitData(i, 1);
                    sampleFreq = app.sampleFitData(i, 2);
                    sampleQ0 = app.sampleFitData(i, 4);
                    cavityFreq = app.cavityFitData(i, 2);
                    cavityQ0 = app.cavityFitData(i, 4);

                    % 修正后的介电常数公式
                    epsilonPrime = 1 + (cavityFreq - sampleFreq) / sampleFreq * A;
                    epsilonDoublePrime = (1/sampleQ0 - 1/cavityQ0) * B;
                    tanDelta = epsilonDoublePrime / epsilonPrime;

                    % 保存所有8个要求的数据项
                    app.epsilonResults(end+1, :) = [sampleTemp, sampleFreq, cavityFreq, sampleQ0, cavityQ0, epsilonPrime, epsilonDoublePrime, tanDelta];
                end

                % 绘制ε'-T曲线（右上）和ε''-T曲线（右下）
                cla(app.ax_Upper);
                cla(app.ax_Lower);

                % 重置坐标轴为自动模式（清除之前单文件/双文件的 manual 设置）
                app.ax_Upper.XLimMode = 'auto';
                app.ax_Upper.YLimMode = 'auto';
                app.ax_Upper.DataAspectRatioMode = 'auto';
                app.ax_Upper.PlotBoxAspectRatioMode = 'auto';

                % 重置坐标轴为自动模式（清除之前单文件/双文件的 manual 设置）
                app.ax_Lower.XLimMode = 'auto';
                app.ax_Lower.YLimMode = 'auto';
                app.ax_Lower.DataAspectRatioMode = 'auto';
                app.ax_Lower.PlotBoxAspectRatioMode = 'auto';


                hold(app.ax_Upper, 'on'); grid(app.ax_Upper, 'on');
                plot(app.ax_Upper, app.epsilonResults(:,1), app.epsilonResults(:,6), 'b.-', 'LineWidth', 1.5, 'MarkerSize', 6);
                xlabel(app.ax_Upper, '温度 (K)');
                ylabel(app.ax_Upper, '相对介电常数 ε''');
                title(app.ax_Upper, 'ε''-T曲线');
                axis(app.ax_Upper, 'auto');      % ← 加入这一行

                hold(app.ax_Lower, 'on'); grid(app.ax_Lower, 'on');
                plot(app.ax_Lower, app.epsilonResults(:,1), app.epsilonResults(:,7), 'r.-', 'LineWidth', 1.5, 'MarkerSize', 6);
                xlabel(app.ax_Lower, '温度 (K)');
                ylabel(app.ax_Lower, '损耗因子 ε''''');
                title(app.ax_Lower, 'ε''''-T曲线');
                axis(app.ax_Lower, 'auto');      % ← 加入这一行

                app.addLog(sprintf('✅ 介电常数计算完成，共 %d 个温度点', size(app.epsilonResults, 1)), 'success');
                app.addLog(sprintf('平均ε''=%.4f，平均tanδ=%.6f', mean(app.epsilonResults(:,6)), mean(app.epsilonResults(:,8))), 'info');

            catch ME
                app.addLog(sprintf('❌ 介电常数计算失败: %s', ME.message), 'error');
            end
        end

        % Button pushed function: btn_ExportdielectricData
        function btn_ExportdielectricDataButtonPushed(app, event)
            try
                if isempty(app.epsilonResults)
                    app.addLog('❌ 没有可导出的介电常数数据', 'error');
                    return;
                end

                % 导出介电常数数据
                [fileName, pathName] = uiputfile('*.xlsx', '导出介电常数数据', ...
                    sprintf('介电常数结果_%s.xlsx', char(datetime('now', 'Format', 'yyyyMMdd_HHmmss'))));
                if fileName == 0
                    return;
                end

                fullPath = fullfile(pathName, fileName);
                T = table(...
                    app.epsilonResults(:,1), ...  % 样品温度
                    app.epsilonResults(:,2), ...  % 样品频率(GHz)
                    app.epsilonResults(:,3), ...  % 空腔频率(GHz)
                    app.epsilonResults(:,4), ...  % 样品无载Q
                    app.epsilonResults(:,5), ...  % 空腔无载Q
                    app.epsilonResults(:,6), ...  % 相对介电常数ε'
                    app.epsilonResults(:,7), ...  % 损耗因子ε''
                    app.epsilonResults(:,8), ...  % 损耗正切角tanδ
                    'VariableNames', {'温度_K', '样品频率_GHz', '空腔频率_GHz', '样品无载Q', '空腔无载Q', '相对介电常数_epsilon', '损耗因子_epsilon_double_prime', '损耗正切角_tan_delta'});

                writetable(T, fullPath);
                app.addLog(sprintf('✅ 介电常数数据已导出到: %s', fullPath), 'success');

            catch ME
                app.addLog(sprintf('❌ 导出失败: %s', ME.message), 'error');
            end
        end

        % Value changed function: sw_TempMonitor
        function sw_TempMonitorValueChanged(app, event)
            value = app.sw_TempMonitor.Value;   % "On" 或 "Off"

            if strcmp(value, "On")
                % ---------- 用户手动开启温度监视 ----------
                % 1. 检查控温仪是否已连接
                if isempty(app.tempDev) || ~isvalid(app.tempDev)
                    app.addLog('❌ 控温仪未连接，无法开启温度监视', 'error');
                    app.sw_TempMonitor.Value = "Off";
                    return;
                end

                % 2. 如果测试正在运行且未暂停，主循环已经在更新温度，不允许开启
                if app.isTestRunning && ~app.isTestPaused
                    app.addLog('⚠️ 测试中已实时更新温度，无需额外监视', 'warning');
                    app.sw_TempMonitor.Value = "Off";
                    return;
                end

                % 3. 启动监视定时器
                startTempMonitor(app);
                app.addLog('🌡️ 温度监视已开启', 'info');

            else
                % ---------- 用户手动关闭温度监视 ----------
                stopTempMonitor(app);
                app.addLog('🌡️ 温度监视已关闭', 'info');
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Position = [100 100 1200 700];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @UIFigureCloseRequest, true);

            % Create Panel_Test
            app.Panel_Test = uipanel(app.UIFigure);
            app.Panel_Test.BorderType = 'none';
            app.Panel_Test.Visible = 'off';
            app.Panel_Test.Position = [0 40 1200 660];

            % Create ax_TempCurve
            app.ax_TempCurve = uiaxes(app.Panel_Test);
            title(app.ax_TempCurve, 'Sample Temperature–Time Curve')
            xlabel(app.ax_TempCurve, 'Time (min)')
            ylabel(app.ax_TempCurve, 'Temp (K)')
            zlabel(app.ax_TempCurve, 'Z')
            app.ax_TempCurve.YGrid = 'on';
            app.ax_TempCurve.Position = [420 210 540 330];

            % Create btn_EmergencyStop
            app.btn_EmergencyStop = uibutton(app.Panel_Test, 'push');
            app.btn_EmergencyStop.ButtonPushedFcn = createCallbackFcn(app, @btn_EmergencyStopButtonPushed, true);
            app.btn_EmergencyStop.BackgroundColor = [1 0 0];
            app.btn_EmergencyStop.FontSize = 14;
            app.btn_EmergencyStop.FontWeight = 'bold';
            app.btn_EmergencyStop.FontColor = [1 1 1];
            app.btn_EmergencyStop.Position = [1068 15 125 35];
            app.btn_EmergencyStop.Text = 'Emergency Stop';

            % Create btn_BackToMain2
            app.btn_BackToMain2 = uibutton(app.Panel_Test, 'push');
            app.btn_BackToMain2.ButtonPushedFcn = createCallbackFcn(app, @btn_BackToMain2ButtonPushed, true);
            app.btn_BackToMain2.Position = [1068 65 125 35];
            app.btn_BackToMain2.Text = 'Return to Main Page';

            % Create lbl_TestTitle
            app.lbl_TestTitle = uilabel(app.Panel_Test);
            app.lbl_TestTitle.BackgroundColor = [0 0.4392 0.7412];
            app.lbl_TestTitle.HorizontalAlignment = 'center';
            app.lbl_TestTitle.FontSize = 36;
            app.lbl_TestTitle.FontWeight = 'bold';
            app.lbl_TestTitle.FontColor = [1 1 1];
            app.lbl_TestTitle.Position = [1 560 1200 101];
            app.lbl_TestTitle.Text = 'Automatic Temperature-Sweep Measurement';

            % Create lbl_SetVNAparameter
            app.lbl_SetVNAparameter = uilabel(app.Panel_Test);
            app.lbl_SetVNAparameter.FontSize = 14;
            app.lbl_SetVNAparameter.FontWeight = 'bold';
            app.lbl_SetVNAparameter.Position = [20 530 177 25];
            app.lbl_SetVNAparameter.Text = '1.VNA Parameter Settings';

            % Create btn_StarFOK
            app.btn_StarFOK = uibutton(app.Panel_Test, 'push');
            app.btn_StarFOK.ButtonPushedFcn = createCallbackFcn(app, @btn_StarFOKButtonPushed, true);
            app.btn_StarFOK.Position = [240 490 60 22];
            app.btn_StarFOK.Text = 'OK';

            % Create btn_StopFOK
            app.btn_StopFOK = uibutton(app.Panel_Test, 'push');
            app.btn_StopFOK.ButtonPushedFcn = createCallbackFcn(app, @btn_StopFOKButtonPushed, true);
            app.btn_StopFOK.Position = [240 458 60 22];
            app.btn_StopFOK.Text = 'OK';

            % Create btn_CenterFOK
            app.btn_CenterFOK = uibutton(app.Panel_Test, 'push');
            app.btn_CenterFOK.ButtonPushedFcn = createCallbackFcn(app, @btn_CenterFOKButtonPushed, true);
            app.btn_CenterFOK.Position = [240 426 60 22];
            app.btn_CenterFOK.Text = 'OK';

            % Create btn_SpanFOK
            app.btn_SpanFOK = uibutton(app.Panel_Test, 'push');
            app.btn_SpanFOK.ButtonPushedFcn = createCallbackFcn(app, @btn_SpanFOKButtonPushed, true);
            app.btn_SpanFOK.Position = [240 394 60 22];
            app.btn_SpanFOK.Text = 'OK';

            % Create btn_PointOK
            app.btn_PointOK = uibutton(app.Panel_Test, 'push');
            app.btn_PointOK.ButtonPushedFcn = createCallbackFcn(app, @btn_PointOKButtonPushed, true);
            app.btn_PointOK.Position = [240 362 60 22];
            app.btn_PointOK.Text = 'OK';

            % Create btn_PowerOK
            app.btn_PowerOK = uibutton(app.Panel_Test, 'push');
            app.btn_PowerOK.ButtonPushedFcn = createCallbackFcn(app, @btn_PowerOKButtonPushed, true);
            app.btn_PowerOK.Position = [240 330 60 22];
            app.btn_PowerOK.Text = 'OK';

            % Create btn_IFBandwidthOK
            app.btn_IFBandwidthOK = uibutton(app.Panel_Test, 'push');
            app.btn_IFBandwidthOK.ButtonPushedFcn = createCallbackFcn(app, @btn_IFBandwidthOKButtonPushed, true);
            app.btn_IFBandwidthOK.Position = [240 297 60 23];
            app.btn_IFBandwidthOK.Text = 'OK';

            % Create lbl_StartFreq
            app.lbl_StartFreq = uilabel(app.Panel_Test);
            app.lbl_StartFreq.Position = [20 490 100 22];
            app.lbl_StartFreq.Text = 'Start (GHz):';

            % Create lbl_StopFreq
            app.lbl_StopFreq = uilabel(app.Panel_Test);
            app.lbl_StopFreq.Position = [20 458 111 22];
            app.lbl_StopFreq.Text = 'Stop (GHz):	';

            % Create lbl_CenterFreq
            app.lbl_CenterFreq = uilabel(app.Panel_Test);
            app.lbl_CenterFreq.Position = [20 426 100 22];
            app.lbl_CenterFreq.Text = 'Center (GHz):';

            % Create lbl_Span
            app.lbl_Span = uilabel(app.Panel_Test);
            app.lbl_Span.Position = [20 394 100 22];
            app.lbl_Span.Text = 'Span (GHz):';

            % Create lbl_Points
            app.lbl_Points = uilabel(app.Panel_Test);
            app.lbl_Points.Position = [20 362 100 22];
            app.lbl_Points.Text = 'Points:';

            % Create lbl_Power
            app.lbl_Power = uilabel(app.Panel_Test);
            app.lbl_Power.Position = [20 330 100 22];
            app.lbl_Power.Text = 'Power (dBm):';

            % Create lbl_IFBandwidth
            app.lbl_IFBandwidth = uilabel(app.Panel_Test);
            app.lbl_IFBandwidth.Position = [20 298 110 22];
            app.lbl_IFBandwidth.Text = 'IF Bandwidth (kHz):';

            % Create lbl_AverageCount
            app.lbl_AverageCount = uilabel(app.Panel_Test);
            app.lbl_AverageCount.Position = [20 266 100 22];
            app.lbl_AverageCount.Text = 'Average:';

            % Create edt_StartFreq
            app.edt_StartFreq = uieditfield(app.Panel_Test, 'numeric');
            app.edt_StartFreq.Position = [130 490 100 22];

            % Create edt_StopFreq
            app.edt_StopFreq = uieditfield(app.Panel_Test, 'numeric');
            app.edt_StopFreq.Position = [130 458 100 22];

            % Create edt_CenterFreq
            app.edt_CenterFreq = uieditfield(app.Panel_Test, 'numeric');
            app.edt_CenterFreq.Position = [130 426 100 22];

            % Create edt_Span
            app.edt_Span = uieditfield(app.Panel_Test, 'numeric');
            app.edt_Span.Position = [130 394 100 22];

            % Create edt_Points
            app.edt_Points = uieditfield(app.Panel_Test, 'numeric');
            app.edt_Points.Position = [130 362 100 22];

            % Create edt_Power
            app.edt_Power = uieditfield(app.Panel_Test, 'numeric');
            app.edt_Power.Position = [130 330 100 22];

            % Create edt_IFBandwidth
            app.edt_IFBandwidth = uieditfield(app.Panel_Test, 'numeric');
            app.edt_IFBandwidth.Position = [130 298 100 22];

            % Create edt_AverageCount
            app.edt_AverageCount = uieditfield(app.Panel_Test, 'numeric');
            app.edt_AverageCount.Position = [130 266 100 22];

            % Create btn_MarkertoCenter
            app.btn_MarkertoCenter = uibutton(app.Panel_Test, 'push');
            app.btn_MarkertoCenter.ButtonPushedFcn = createCallbackFcn(app, @btn_MarkertoCenterButtonPushed, true);
            app.btn_MarkertoCenter.Position = [309 426 104 23];
            app.btn_MarkertoCenter.Text = 'Marker to Center';

            % Create btn_MarkerOFF
            app.btn_MarkerOFF = uibutton(app.Panel_Test, 'push');
            app.btn_MarkerOFF.ButtonPushedFcn = createCallbackFcn(app, @btn_MarkerOFFButtonPushed, true);
            app.btn_MarkerOFF.Position = [310 362 102 23];
            app.btn_MarkerOFF.Text = 'Marker OFF';

            % Create btn_3dBBWSearch
            app.btn_3dBBWSearch = uibutton(app.Panel_Test, 'push');
            app.btn_3dBBWSearch.ButtonPushedFcn = createCallbackFcn(app, @btn_3dBBWSearchButtonPushed, true);
            app.btn_3dBBWSearch.Position = [310 394 102 23];
            app.btn_3dBBWSearch.Text = '-3dB BW Search';

            % Create btn_Autoscale
            app.btn_Autoscale = uibutton(app.Panel_Test, 'push');
            app.btn_Autoscale.ButtonPushedFcn = createCallbackFcn(app, @btn_AutoscaleButtonPushed, true);
            app.btn_Autoscale.Position = [309 458 104 23];
            app.btn_Autoscale.Text = 'Autoscale';

            % Create sw_AverageSW
            app.sw_AverageSW = uiswitch(app.Panel_Test, 'slider');
            app.sw_AverageSW.ValueChangedFcn = createCallbackFcn(app, @sw_AverageSWValueChanged, true);
            app.sw_AverageSW.Position = [262 268 38 17];

            % Create lbl_SetTemparameter
            app.lbl_SetTemparameter = uilabel(app.Panel_Test);
            app.lbl_SetTemparameter.FontSize = 14;
            app.lbl_SetTemparameter.FontWeight = 'bold';
            app.lbl_SetTemparameter.Position = [20 220 236 25];
            app.lbl_SetTemparameter.Text = '2.Temperature Control Parameters';

            % Create lbl_Ramp
            app.lbl_Ramp = uilabel(app.Panel_Test);
            app.lbl_Ramp.Position = [20 180 120 22];
            app.lbl_Ramp.Text = 'Ramp (K/min):';

            % Create edt_RampRate
            app.edt_RampRate = uieditfield(app.Panel_Test, 'numeric');
            app.edt_RampRate.Position = [150 180 100 22];

            % Create lbl_SetTemp
            app.lbl_SetTemp = uilabel(app.Panel_Test);
            app.lbl_SetTemp.Position = [20 148 120 22];
            app.lbl_SetTemp.Text = 'Final Temp (K):';

            % Create edt_TargetTemp
            app.edt_TargetTemp = uieditfield(app.Panel_Test, 'numeric');
            app.edt_TargetTemp.Position = [150 148 100 22];

            % Create lbl_StableTime
            app.lbl_StableTime = uilabel(app.Panel_Test);
            app.lbl_StableTime.Position = [20 116 120 22];
            app.lbl_StableTime.Text = 'Stable Time (s):';

            % Create edt_StableTime
            app.edt_StableTime = uieditfield(app.Panel_Test, 'numeric');
            app.edt_StableTime.Position = [150 116 100 22];

            % Create lbl_SaveInterval
            app.lbl_SaveInterval = uilabel(app.Panel_Test);
            app.lbl_SaveInterval.Position = [20 84 120 22];
            app.lbl_SaveInterval.Text = 'Save Interval (K):';

            % Create edt_SaveInterval
            app.edt_SaveInterval = uieditfield(app.Panel_Test, 'numeric');
            app.edt_SaveInterval.Position = [150 84 100 22];

            % Create lbl_SampleName
            app.lbl_SampleName = uilabel(app.Panel_Test);
            app.lbl_SampleName.Position = [20 52 120 22];
            app.lbl_SampleName.Text = 'Sample name:';

            % Create edt_SampleName
            app.edt_SampleName = uieditfield(app.Panel_Test, 'text');
            app.edt_SampleName.Position = [150 52 100 22];

            % Create btn_SelectSavePath
            app.btn_SelectSavePath = uibutton(app.Panel_Test, 'push');
            app.btn_SelectSavePath.ButtonPushedFcn = createCallbackFcn(app, @btn_SelectSavePathButtonPushed, true);
            app.btn_SelectSavePath.Position = [20 7 160 38];
            app.btn_SelectSavePath.Text = {'Select Save Path'; ''; ''};

            % Create lbl_CurrentPath
            app.lbl_CurrentPath = uilabel(app.Panel_Test);
            app.lbl_CurrentPath.WordWrap = 'on';
            app.lbl_CurrentPath.Position = [190 15 160 30];
            app.lbl_CurrentPath.Text = '';

            % Create lbl_TempParameter
            app.lbl_TempParameter = uilabel(app.Panel_Test);
            app.lbl_TempParameter.FontSize = 14;
            app.lbl_TempParameter.FontWeight = 'bold';
            app.lbl_TempParameter.Position = [420 170 129 25];
            app.lbl_TempParameter.Text = '3.Temp Monitor';

            % Create lbl_SampleTemp
            app.lbl_SampleTemp = uilabel(app.Panel_Test);
            app.lbl_SampleTemp.FontSize = 14;
            app.lbl_SampleTemp.Position = [420 130 200 25];
            app.lbl_SampleTemp.Text = 'Sample: -- K';

            % Create lbl_SampleHeadTemp
            app.lbl_SampleHeadTemp = uilabel(app.Panel_Test);
            app.lbl_SampleHeadTemp.FontSize = 14;
            app.lbl_SampleHeadTemp.Position = [420 100 200 25];
            app.lbl_SampleHeadTemp.Text = 'Samplehead: -- K';

            % Create lbl_ResonatorTemp
            app.lbl_ResonatorTemp = uilabel(app.Panel_Test);
            app.lbl_ResonatorTemp.FontSize = 14;
            app.lbl_ResonatorTemp.Position = [740 130 200 25];
            app.lbl_ResonatorTemp.Text = 'Resonator: -- K';

            % Create lbl_ResonatorHeadTemp
            app.lbl_ResonatorHeadTemp = uilabel(app.Panel_Test);
            app.lbl_ResonatorHeadTemp.FontSize = 14;
            app.lbl_ResonatorHeadTemp.Position = [740 100 200 25];
            app.lbl_ResonatorHeadTemp.Text = 'Resonatorhead: -- K';

            % Create lbl_Progress
            app.lbl_Progress = uilabel(app.Panel_Test);
            app.lbl_Progress.FontSize = 14;
            app.lbl_Progress.Position = [420 70 200 25];
            app.lbl_Progress.Text = 'Test Points: 0/0';

            % Create lbl_RemainingTime
            app.lbl_RemainingTime = uilabel(app.Panel_Test);
            app.lbl_RemainingTime.FontSize = 14;
            app.lbl_RemainingTime.Position = [740 70 200 25];
            app.lbl_RemainingTime.Text = 'Remaining Time: -- min';

            % Create btn_StartTest
            app.btn_StartTest = uibutton(app.Panel_Test, 'push');
            app.btn_StartTest.ButtonPushedFcn = createCallbackFcn(app, @btn_StartTestButtonPushed, true);
            app.btn_StartTest.BackgroundColor = [0.2 0.8 0.2];
            app.btn_StartTest.FontSize = 14;
            app.btn_StartTest.FontColor = [1 1 1];
            app.btn_StartTest.Position = [420 15 120 35];
            app.btn_StartTest.Text = 'Start';

            % Create btn_PauseTest
            app.btn_PauseTest = uibutton(app.Panel_Test, 'push');
            app.btn_PauseTest.ButtonPushedFcn = createCallbackFcn(app, @btn_PauseTestButtonPushed, true);
            app.btn_PauseTest.FontSize = 14;
            app.btn_PauseTest.Enable = 'off';
            app.btn_PauseTest.Position = [550 15 120 35];
            app.btn_PauseTest.Text = 'Pause';

            % Create btn_StopTest
            app.btn_StopTest = uibutton(app.Panel_Test, 'push');
            app.btn_StopTest.ButtonPushedFcn = createCallbackFcn(app, @btn_StopTestButtonPushed, true);
            app.btn_StopTest.BackgroundColor = [1 0 0];
            app.btn_StopTest.FontSize = 14;
            app.btn_StopTest.FontColor = [1 1 1];
            app.btn_StopTest.Enable = 'off';
            app.btn_StopTest.Position = [680 15 120 35];
            app.btn_StopTest.Text = 'Stop';

            % Create btn_ExportTempExcel
            app.btn_ExportTempExcel = uibutton(app.Panel_Test, 'push');
            app.btn_ExportTempExcel.ButtonPushedFcn = createCallbackFcn(app, @btn_ExportTempExcelButtonPushed, true);
            app.btn_ExportTempExcel.BackgroundColor = [1 1 1];
            app.btn_ExportTempExcel.FontSize = 14;
            app.btn_ExportTempExcel.Position = [815 16 171 35];
            app.btn_ExportTempExcel.Text = 'Export Temperature Data';

            % Create Label
            app.Label = uilabel(app.Panel_Test);
            app.Label.HorizontalAlignment = 'center';
            app.Label.FontWeight = 'bold';
            app.Label.Position = [547 171 46 22];
            app.Label.Text = 'Update';

            % Create sw_TempMonitor
            app.sw_TempMonitor = uiswitch(app.Panel_Test, 'slider');
            app.sw_TempMonitor.ValueChangedFcn = createCallbackFcn(app, @sw_TempMonitorValueChanged, true);
            app.sw_TempMonitor.Position = [618 170 45 20];

            % Create dd_Sparam
            app.dd_Sparam = uidropdown(app.Panel_Test);
            app.dd_Sparam.Items = {'S11', 'S21', 'S22', 'S12'};
            app.dd_Sparam.ValueChangedFcn = createCallbackFcn(app, @dd_SparamValueChanged, true);
            app.dd_Sparam.Position = [310 490 103 22];
            app.dd_Sparam.Value = 'S21';

            % Create Panel_Data
            app.Panel_Data = uipanel(app.UIFigure);
            app.Panel_Data.BorderType = 'none';
            app.Panel_Data.Visible = 'off';
            app.Panel_Data.Position = [0 40 1200 660];

            % Create ax_Upper
            app.ax_Upper = uiaxes(app.Panel_Data);
            title(app.ax_Upper, 'Title')
            zlabel(app.ax_Upper, 'Z')
            app.ax_Upper.Position = [420 310 540 250];

            % Create ax_Lower
            app.ax_Lower = uiaxes(app.Panel_Data);
            title(app.ax_Lower, 'Title')
            zlabel(app.ax_Lower, 'Z')
            app.ax_Lower.Position = [420 50 540 250];

            % Create btn_BackToMain3
            app.btn_BackToMain3 = uibutton(app.Panel_Data, 'push');
            app.btn_BackToMain3.ButtonPushedFcn = createCallbackFcn(app, @btn_BackToMain3ButtonPushed, true);
            app.btn_BackToMain3.Position = [1068 65 125 35];
            app.btn_BackToMain3.Text = 'Return to Main Page';

            % Create lbl_DataTitle
            app.lbl_DataTitle = uilabel(app.Panel_Data);
            app.lbl_DataTitle.BackgroundColor = [0 0.4392 0.7412];
            app.lbl_DataTitle.HorizontalAlignment = 'center';
            app.lbl_DataTitle.FontSize = 36;
            app.lbl_DataTitle.FontWeight = 'bold';
            app.lbl_DataTitle.FontColor = [1 1 1];
            app.lbl_DataTitle.Position = [1 561 1200 101];
            app.lbl_DataTitle.Text = 'Data Post-Processing and Analysis';

            % Create lbl_Fileoperations
            app.lbl_Fileoperations = uilabel(app.Panel_Data);
            app.lbl_Fileoperations.FontSize = 14;
            app.lbl_Fileoperations.FontWeight = 'bold';
            app.lbl_Fileoperations.Position = [20 500 119 22];
            app.lbl_Fileoperations.Text = '1.File Operations';

            % Create btn_SelectSingleFile
            app.btn_SelectSingleFile = uibutton(app.Panel_Data, 'push');
            app.btn_SelectSingleFile.ButtonPushedFcn = createCallbackFcn(app, @btn_SelectSingleFileButtonPushed, true);
            app.btn_SelectSingleFile.Position = [20 460 360 30];
            app.btn_SelectSingleFile.Text = 'Single File Fitting';

            % Create btn_SelectCompareFiles
            app.btn_SelectCompareFiles = uibutton(app.Panel_Data, 'push');
            app.btn_SelectCompareFiles.ButtonPushedFcn = createCallbackFcn(app, @btn_SelectCompareFilesButtonPushed, true);
            app.btn_SelectCompareFiles.Position = [20 420 360 30];
            app.btn_SelectCompareFiles.Text = 'Two Files for Fitting Comparison';

            % Create btn_SelectBatchFolder
            app.btn_SelectBatchFolder = uibutton(app.Panel_Data, 'push');
            app.btn_SelectBatchFolder.ButtonPushedFcn = createCallbackFcn(app, @btn_SelectBatchFolderButtonPushed, true);
            app.btn_SelectBatchFolder.Position = [20 380 360 30];
            app.btn_SelectBatchFolder.Text = 'Folder for Batch Processing';

            % Create btn_ProcessData
            app.btn_ProcessData = uibutton(app.Panel_Data, 'push');
            app.btn_ProcessData.ButtonPushedFcn = createCallbackFcn(app, @btn_ProcessDataButtonPushed, true);
            app.btn_ProcessData.Position = [20 340 170 30];
            app.btn_ProcessData.Text = 'Start Processing';

            % Create btn_ExportFitData
            app.btn_ExportFitData = uibutton(app.Panel_Data, 'push');
            app.btn_ExportFitData.ButtonPushedFcn = createCallbackFcn(app, @btn_ExportFitDataButtonPushed, true);
            app.btn_ExportFitData.Position = [210 340 170 30];
            app.btn_ExportFitData.Text = 'Export Fitting Data';

            % Create lbl_Parametercal
            app.lbl_Parametercal = uilabel(app.Panel_Data);
            app.lbl_Parametercal.FontSize = 14;
            app.lbl_Parametercal.FontWeight = 'bold';
            app.lbl_Parametercal.Position = [20 290 165 22];
            app.lbl_Parametercal.Text = '2.Parameter Calculation';

            % Create btn_SelectCavityFolder
            app.btn_SelectCavityFolder = uibutton(app.Panel_Data, 'push');
            app.btn_SelectCavityFolder.ButtonPushedFcn = createCallbackFcn(app, @btn_SelectCavityFolderButtonPushed, true);
            app.btn_SelectCavityFolder.Position = [20 250 170 30];
            app.btn_SelectCavityFolder.Text = 'Select Cavity Folder';

            % Create btn_SelectSampleFolder
            app.btn_SelectSampleFolder = uibutton(app.Panel_Data, 'push');
            app.btn_SelectSampleFolder.ButtonPushedFcn = createCallbackFcn(app, @btn_SelectSampleFolderButtonPushed, true);
            app.btn_SelectSampleFolder.Position = [210 250 170 30];
            app.btn_SelectSampleFolder.Text = 'Select Sample Folder';

            % Create lbl_Gvalue
            app.lbl_Gvalue = uilabel(app.Panel_Data);
            app.lbl_Gvalue.Position = [30 209 60 30];
            app.lbl_Gvalue.Text = {'Geometric'; 'Factor：'};

            % Create edt_GeometryFactor
            app.edt_GeometryFactor = uieditfield(app.Panel_Data, 'numeric');
            app.edt_GeometryFactor.Position = [110 210 80 22];

            % Create btn_CalculateRs
            app.btn_CalculateRs = uibutton(app.Panel_Data, 'push');
            app.btn_CalculateRs.ButtonPushedFcn = createCallbackFcn(app, @btn_CalculateRsButtonPushed, true);
            app.btn_CalculateRs.BackgroundColor = [0.9608 0.9608 0.9608];
            app.btn_CalculateRs.Position = [19 170 172 30];
            app.btn_CalculateRs.Text = 'Calculate Surface Resistance';

            % Create btn_ExportRsData
            app.btn_ExportRsData = uibutton(app.Panel_Data, 'push');
            app.btn_ExportRsData.ButtonPushedFcn = createCallbackFcn(app, @btn_ExportRsDataButtonPushed, true);
            app.btn_ExportRsData.Position = [202 170 186 30];
            app.btn_ExportRsData.Text = 'Export Surface Resistance Data';

            % Create lbl_Dividingline
            app.lbl_Dividingline = uilabel(app.Panel_Data);
            app.lbl_Dividingline.BackgroundColor = [0 0 0];
            app.lbl_Dividingline.Position = [20 160 360 1];
            app.lbl_Dividingline.Text = '';

            % Create lbl_CalA
            app.lbl_CalA = uilabel(app.Panel_Data);
            app.lbl_CalA.Position = [20 130 80 22];
            app.lbl_CalA.Text = 'Constant A：';

            % Create edt_CalA
            app.edt_CalA = uieditfield(app.Panel_Data, 'numeric');
            app.edt_CalA.Position = [110 130 80 22];

            % Create lbl_CalB
            app.lbl_CalB = uilabel(app.Panel_Data);
            app.lbl_CalB.Position = [210 130 80 22];
            app.lbl_CalB.Text = 'Constant B：';

            % Create edt_CalB
            app.edt_CalB = uieditfield(app.Panel_Data, 'numeric');
            app.edt_CalB.Position = [300 130 80 22];

            % Create btn_Calculatedielectric
            app.btn_Calculatedielectric = uibutton(app.Panel_Data, 'push');
            app.btn_Calculatedielectric.ButtonPushedFcn = createCallbackFcn(app, @btn_CalculatedielectricButtonPushed, true);
            app.btn_Calculatedielectric.BackgroundColor = [0.9608 0.9608 0.9608];
            app.btn_Calculatedielectric.Position = [20 84 170 30];
            app.btn_Calculatedielectric.Text = 'Calculate Dielectric Constant';

            % Create btn_ExportdielectricData
            app.btn_ExportdielectricData = uibutton(app.Panel_Data, 'push');
            app.btn_ExportdielectricData.ButtonPushedFcn = createCallbackFcn(app, @btn_ExportdielectricDataButtonPushed, true);
            app.btn_ExportdielectricData.Position = [210 84 170 30];
            app.btn_ExportdielectricData.Text = 'Export Dielectric Data';

            % Create Panel_Instrument
            app.Panel_Instrument = uipanel(app.UIFigure);
            app.Panel_Instrument.BorderType = 'none';
            app.Panel_Instrument.Visible = 'off';
            app.Panel_Instrument.Position = [0 40 1200 660];

            % Create btn_BackToMain1
            app.btn_BackToMain1 = uibutton(app.Panel_Instrument, 'push');
            app.btn_BackToMain1.ButtonPushedFcn = createCallbackFcn(app, @btn_BackToMain1ButtonPushed, true);
            app.btn_BackToMain1.Position = [1068 62 125 38];
            app.btn_BackToMain1.Text = {'Return to Main Page'; ''; ''};

            % Create lbl_InstrumentTitle
            app.lbl_InstrumentTitle = uilabel(app.Panel_Instrument);
            app.lbl_InstrumentTitle.BackgroundColor = [0 0.4392 0.7412];
            app.lbl_InstrumentTitle.HorizontalAlignment = 'center';
            app.lbl_InstrumentTitle.FontSize = 36;
            app.lbl_InstrumentTitle.FontWeight = 'bold';
            app.lbl_InstrumentTitle.FontColor = [1 1 1];
            app.lbl_InstrumentTitle.Position = [1 561 1200 100];
            app.lbl_InstrumentTitle.Text = {'Instrument Connection'; ''; ''};

            % Create lbl_VNATitle
            app.lbl_VNATitle = uilabel(app.Panel_Instrument);
            app.lbl_VNATitle.FontSize = 14;
            app.lbl_VNATitle.FontWeight = 'bold';
            app.lbl_VNATitle.Position = [171 483 200 22];
            app.lbl_VNATitle.Text = '1. VNA';

            % Create lbl_VNAModel
            app.lbl_VNAModel = uilabel(app.Panel_Instrument);
            app.lbl_VNAModel.FontSize = 11;
            app.lbl_VNAModel.FontColor = [0.4 0.4 0.4];
            app.lbl_VNAModel.Position = [171 453 250 22];
            app.lbl_VNAModel.Text = 'Device Model：Keysight P9377B';

            % Create lbl_VNAAddr
            app.lbl_VNAAddr = uilabel(app.Panel_Instrument);
            app.lbl_VNAAddr.FontSize = 11;
            app.lbl_VNAAddr.Position = [171 413 80 22];
            app.lbl_VNAAddr.Text = 'Address：';

            % Create dd_VNA
            app.dd_VNA = uidropdown(app.Panel_Instrument);
            app.dd_VNA.Items = {};
            app.dd_VNA.ValueChangedFcn = createCallbackFcn(app, @dd_VNAValueChanged, true);
            app.dd_VNA.FontSize = 11;
            app.dd_VNA.Position = [251 415 120 25];
            app.dd_VNA.Value = {};

            % Create btn_VNAConnect
            app.btn_VNAConnect = uibutton(app.Panel_Instrument, 'push');
            app.btn_VNAConnect.ButtonPushedFcn = createCallbackFcn(app, @btn_VNAConnectButtonPushed, true);
            app.btn_VNAConnect.Position = [171 375 80 25];
            app.btn_VNAConnect.Text = 'Connection';

            % Create btn_VNADisconnect
            app.btn_VNADisconnect = uibutton(app.Panel_Instrument, 'push');
            app.btn_VNADisconnect.ButtonPushedFcn = createCallbackFcn(app, @btn_VNADisconnectButtonPushed, true);
            app.btn_VNADisconnect.Position = [261 375 80 25];
            app.btn_VNADisconnect.Text = 'Exit';

            % Create lbl_VNAStatus
            app.lbl_VNAStatus = uilabel(app.Panel_Instrument);
            app.lbl_VNAStatus.Position = [171 333 51 22];
            app.lbl_VNAStatus.Text = 'Status：';

            % Create lamp_VNA
            app.lamp_VNA = uilamp(app.Panel_Instrument);
            app.lamp_VNA.Position = [221 337 16 16];
            app.lamp_VNA.Color = [0.4 0.4 0.4];

            % Create lbl_VNAStatusText
            app.lbl_VNAStatusText = uilabel(app.Panel_Instrument);
            app.lbl_VNAStatusText.FontColor = [0.4 0.4 0.4];
            app.lbl_VNAStatusText.Position = [241 333 80 22];
            app.lbl_VNAStatusText.Text = 'Disconnected';

            % Create lbl_TempDevTitle
            app.lbl_TempDevTitle = uilabel(app.Panel_Instrument);
            app.lbl_TempDevTitle.FontSize = 14;
            app.lbl_TempDevTitle.FontWeight = 'bold';
            app.lbl_TempDevTitle.Position = [711 483 200 22];
            app.lbl_TempDevTitle.Text = '2.Temperature Controller';

            % Create lbl_TempDevModel
            app.lbl_TempDevModel = uilabel(app.Panel_Instrument);
            app.lbl_TempDevModel.FontSize = 11;
            app.lbl_TempDevModel.FontColor = [0.4 0.4 0.4];
            app.lbl_TempDevModel.Position = [711 431 250 44];
            app.lbl_TempDevModel.Text = 'Device Model：Lakeshore 336';

            % Create lbl_TempDevAddr
            app.lbl_TempDevAddr = uilabel(app.Panel_Instrument);
            app.lbl_TempDevAddr.FontSize = 11;
            app.lbl_TempDevAddr.Position = [711 413 80 22];
            app.lbl_TempDevAddr.Text = 'Address：';

            % Create dd_TempDev
            app.dd_TempDev = uidropdown(app.Panel_Instrument);
            app.dd_TempDev.Items = {};
            app.dd_TempDev.ValueChangedFcn = createCallbackFcn(app, @dd_TempDevValueChanged, true);
            app.dd_TempDev.FontSize = 11;
            app.dd_TempDev.Position = [791 415 120 25];
            app.dd_TempDev.Value = {};

            % Create btn_TempDevConnect
            app.btn_TempDevConnect = uibutton(app.Panel_Instrument, 'push');
            app.btn_TempDevConnect.ButtonPushedFcn = createCallbackFcn(app, @btn_TempDevConnectButtonPushed, true);
            app.btn_TempDevConnect.Position = [711 375 80 25];
            app.btn_TempDevConnect.Text = 'Connection';

            % Create btn_TempDevDisconnect
            app.btn_TempDevDisconnect = uibutton(app.Panel_Instrument, 'push');
            app.btn_TempDevDisconnect.ButtonPushedFcn = createCallbackFcn(app, @btn_TempDevDisconnectButtonPushed, true);
            app.btn_TempDevDisconnect.Position = [801 375 80 25];
            app.btn_TempDevDisconnect.Text = 'Exit';

            % Create lbl_TempDevStatus
            app.lbl_TempDevStatus = uilabel(app.Panel_Instrument);
            app.lbl_TempDevStatus.Position = [711 333 51 22];
            app.lbl_TempDevStatus.Text = 'Status：';

            % Create lamp_TempDev
            app.lamp_TempDev = uilamp(app.Panel_Instrument);
            app.lamp_TempDev.Position = [761 337 16 16];
            app.lamp_TempDev.Color = [0.4 0.4 0.4];

            % Create lbl_TempDevStatusText
            app.lbl_TempDevStatusText = uilabel(app.Panel_Instrument);
            app.lbl_TempDevStatusText.FontColor = [0.4 0.4 0.4];
            app.lbl_TempDevStatusText.Position = [781 333 80 22];
            app.lbl_TempDevStatusText.Text = 'Disconnected';

            % Create lbl_SwitchTitle
            app.lbl_SwitchTitle = uilabel(app.Panel_Instrument);
            app.lbl_SwitchTitle.FontSize = 14;
            app.lbl_SwitchTitle.FontWeight = 'bold';
            app.lbl_SwitchTitle.Position = [171 258 200 22];
            app.lbl_SwitchTitle.Text = '3.Coaxial Switch';

            % Create lbl_SwitchModel
            app.lbl_SwitchModel = uilabel(app.Panel_Instrument);
            app.lbl_SwitchModel.FontSize = 11;
            app.lbl_SwitchModel.FontColor = [0.4 0.4 0.4];
            app.lbl_SwitchModel.Position = [171 230 250 22];
            app.lbl_SwitchModel.Text = 'Device Model：HD-320SGAH15K';

            % Create lbl_SwitchAddr
            app.lbl_SwitchAddr = uilabel(app.Panel_Instrument);
            app.lbl_SwitchAddr.FontSize = 11;
            app.lbl_SwitchAddr.Position = [171 188 80 22];
            app.lbl_SwitchAddr.Text = 'Address：';

            % Create dd_Switch
            app.dd_Switch = uidropdown(app.Panel_Instrument);
            app.dd_Switch.Items = {};
            app.dd_Switch.ValueChangedFcn = createCallbackFcn(app, @dd_SwitchValueChanged, true);
            app.dd_Switch.FontSize = 11;
            app.dd_Switch.Position = [251 190 120 25];
            app.dd_Switch.Value = {};

            % Create btn_SwitchConnect
            app.btn_SwitchConnect = uibutton(app.Panel_Instrument, 'push');
            app.btn_SwitchConnect.ButtonPushedFcn = createCallbackFcn(app, @btn_SwitchConnectButtonPushed, true);
            app.btn_SwitchConnect.Position = [171 150 80 25];
            app.btn_SwitchConnect.Text = 'Connection';

            % Create btn_SwitchDisconnect
            app.btn_SwitchDisconnect = uibutton(app.Panel_Instrument, 'push');
            app.btn_SwitchDisconnect.ButtonPushedFcn = createCallbackFcn(app, @btn_SwitchDisconnectButtonPushed, true);
            app.btn_SwitchDisconnect.Position = [261 150 80 25];
            app.btn_SwitchDisconnect.Text = 'Exit';

            % Create lbl_SwitchStatus
            app.lbl_SwitchStatus = uilabel(app.Panel_Instrument);
            app.lbl_SwitchStatus.Position = [171 108 51 22];
            app.lbl_SwitchStatus.Text = 'Status：';

            % Create lamp_Switch
            app.lamp_Switch = uilamp(app.Panel_Instrument);
            app.lamp_Switch.Position = [221 112 16 16];
            app.lamp_Switch.Color = [0.4 0.4 0.4];

            % Create lbl_SwitchStatusText
            app.lbl_SwitchStatusText = uilabel(app.Panel_Instrument);
            app.lbl_SwitchStatusText.FontColor = [0.4 0.4 0.4];
            app.lbl_SwitchStatusText.Position = [241 108 80 22];
            app.lbl_SwitchStatusText.Text = 'Disconnected';

            % Create lbl_Switch1
            app.lbl_Switch1 = uilabel(app.Panel_Instrument);
            app.lbl_Switch1.Position = [460 238 60 22];
            app.lbl_Switch1.Text = 'Switch1:';

            % Create lbl_Switch2
            app.lbl_Switch2 = uilabel(app.Panel_Instrument);
            app.lbl_Switch2.Position = [460 198 60 22];
            app.lbl_Switch2.Text = 'Switch2:';

            % Create lbl_Switch3
            app.lbl_Switch3 = uilabel(app.Panel_Instrument);
            app.lbl_Switch3.Position = [460 158 60 22];
            app.lbl_Switch3.Text = 'Switch3:';

            % Create lbl_Switch4
            app.lbl_Switch4 = uilabel(app.Panel_Instrument);
            app.lbl_Switch4.Position = [460 118 60 22];
            app.lbl_Switch4.Text = 'Switch4:';

            % Create sw_Switch1
            app.sw_Switch1 = uiswitch(app.Panel_Instrument, 'slider');
            app.sw_Switch1.ValueChangedFcn = createCallbackFcn(app, @sw_Switch1ValueChanged, true);
            app.sw_Switch1.Position = [556 240 45 20];

            % Create sw_Switch2
            app.sw_Switch2 = uiswitch(app.Panel_Instrument, 'slider');
            app.sw_Switch2.ValueChangedFcn = createCallbackFcn(app, @sw_Switch2ValueChanged, true);
            app.sw_Switch2.Position = [556 200 45 20];

            % Create sw_Switch3
            app.sw_Switch3 = uiswitch(app.Panel_Instrument, 'slider');
            app.sw_Switch3.ValueChangedFcn = createCallbackFcn(app, @sw_Switch3ValueChanged, true);
            app.sw_Switch3.Position = [556 163 45 20];

            % Create sw_Switch4
            app.sw_Switch4 = uiswitch(app.Panel_Instrument, 'slider');
            app.sw_Switch4.ValueChangedFcn = createCallbackFcn(app, @sw_Switch4ValueChanged, true);
            app.sw_Switch4.Position = [556 120 45 20];

            % Create lbl_QuickOpTitle
            app.lbl_QuickOpTitle = uilabel(app.Panel_Instrument);
            app.lbl_QuickOpTitle.FontSize = 14;
            app.lbl_QuickOpTitle.FontWeight = 'bold';
            app.lbl_QuickOpTitle.Position = [711 268 200 22];
            app.lbl_QuickOpTitle.Text = '4.System Quick Actions';

            % Create btn_RefreshAll
            app.btn_RefreshAll = uibutton(app.Panel_Instrument, 'push');
            app.btn_RefreshAll.ButtonPushedFcn = createCallbackFcn(app, @btn_RefreshAllButtonPushed, true);
            app.btn_RefreshAll.BackgroundColor = [0.102 0.6 0.2];
            app.btn_RefreshAll.FontColor = [1 1 1];
            app.btn_RefreshAll.Position = [711 230 200 35];
            app.btn_RefreshAll.Text = 'Refresh Instrument Address';

            % Create btn_Initialization
            app.btn_Initialization = uibutton(app.Panel_Instrument, 'push');
            app.btn_Initialization.ButtonPushedFcn = createCallbackFcn(app, @btn_InitializationButtonPushed, true);
            app.btn_Initialization.BackgroundColor = [0.102 0.6 0.2];
            app.btn_Initialization.FontColor = [1 1 1];
            app.btn_Initialization.Position = [711 177 200 38];
            app.btn_Initialization.Text = {'Instrument Initialization'; ''; ''};

            % Create panel_StatusBar
            app.panel_StatusBar = uipanel(app.UIFigure);
            app.panel_StatusBar.BorderColor = [0.902 0.902 0.902];
            app.panel_StatusBar.BorderType = 'none';
            app.panel_StatusBar.Position = [1 1 1200 40];

            % Create lbl_VNA
            app.lbl_VNA = uilabel(app.panel_StatusBar);
            app.lbl_VNA.Position = [250 10 150 22];

            % Create lbl_TempDev
            app.lbl_TempDev = uilabel(app.panel_StatusBar);
            app.lbl_TempDev.Position = [390 10 200 22];

            % Create lbl_Switch
            app.lbl_Switch = uilabel(app.panel_StatusBar);
            app.lbl_Switch.Position = [620 10 200 22];

            % Create lbl_Time
            app.lbl_Time = uilabel(app.panel_StatusBar);
            app.lbl_Time.Position = [920 10 203 22];

            % Create Panel_Main
            app.Panel_Main = uipanel(app.UIFigure);
            app.Panel_Main.Position = [0 40 1200 560];

            % Create btn_ToData
            app.btn_ToData = uibutton(app.Panel_Main, 'push');
            app.btn_ToData.ButtonPushedFcn = createCallbackFcn(app, @btn_ToDataButtonPushed, true);
            app.btn_ToData.FontName = 'Times New Roman';
            app.btn_ToData.FontSize = 18;
            app.btn_ToData.FontWeight = 'bold';
            app.btn_ToData.Position = [800 250 250 150];
            app.btn_ToData.Text = {'Data post-processing and'; ''; 'analysis'};

            % Create btn_ToTest
            app.btn_ToTest = uibutton(app.Panel_Main, 'push');
            app.btn_ToTest.ButtonPushedFcn = createCallbackFcn(app, @btn_ToTestButtonPushed, true);
            app.btn_ToTest.FontName = 'Times New Roman';
            app.btn_ToTest.FontSize = 18;
            app.btn_ToTest.FontWeight = 'bold';
            app.btn_ToTest.Position = [475 250 250 150];
            app.btn_ToTest.Text = {'Automatic temperature-sweep'; ''; 'measurement'};

            % Create btn_ToInstrument
            app.btn_ToInstrument = uibutton(app.Panel_Main, 'push');
            app.btn_ToInstrument.ButtonPushedFcn = createCallbackFcn(app, @btn_ToInstrumentButtonPushed, true);
            app.btn_ToInstrument.FontName = 'Times New Roman';
            app.btn_ToInstrument.FontSize = 18;
            app.btn_ToInstrument.FontWeight = 'bold';
            app.btn_ToInstrument.Position = [150 250 250 150];
            app.btn_ToInstrument.Text = {'Instrument connection'; ''; ''};

            % Create lbl_GlobalTitle
            app.lbl_GlobalTitle = uilabel(app.UIFigure);
            app.lbl_GlobalTitle.BackgroundColor = [0 0.4392 0.7412];
            app.lbl_GlobalTitle.HorizontalAlignment = 'center';
            app.lbl_GlobalTitle.FontSize = 24;
            app.lbl_GlobalTitle.FontWeight = 'bold';
            app.lbl_GlobalTitle.FontColor = [1 1 1];
            app.lbl_GlobalTitle.Position = [0 599 1200 101];
            app.lbl_GlobalTitle.Text = 'Automatic temperature-sweep acquisition and analysis system for materials';

            % Create tt_LogText
            app.tt_LogText = uitextarea(app.UIFigure);
            app.tt_LogText.Editable = 'off';
            app.tt_LogText.Visible = 'off';
            app.tt_LogText.Position = [980 200 190 330];

            % Create btn_SaveLog
            app.btn_SaveLog = uibutton(app.UIFigure, 'push');
            app.btn_SaveLog.ButtonPushedFcn = createCallbackFcn(app, @btn_SaveLogButtonPushed, true);
            app.btn_SaveLog.Visible = 'off';
            app.btn_SaveLog.Position = [1070 149 120 38];
            app.btn_SaveLog.Text = {'Save Work Log'; ''; ''};

            % Create lbl_LogArea
            app.lbl_LogArea = uilabel(app.UIFigure);
            app.lbl_LogArea.FontSize = 14;
            app.lbl_LogArea.FontWeight = 'bold';
            app.lbl_LogArea.Visible = 'off';
            app.lbl_LogArea.Position = [980 530 83 22];
            app.lbl_LogArea.Text = 'Work Log：';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end