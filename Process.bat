@echo off
SET mname=%1 
SET /A stage_num=%2
SET m_file=%3
SET matlabpath="C:\Program Files\MATLAB\R2018b\bin\matlab.exe"
REM echo "Model File Selected as: = %mname%
REM echo "Stage number is: = %stage_num%

IF %stage_num%==1 (
	REM %matlabpath% -wait -log -nodesktop -nosplash -r "ip=getenv('mname');model_file=strtrim(ip);ret=UpdateMdl(model_file);pause(5);exit"
	REM goto return_value
)
IF %stage_num%==2 (
	%matlabpath% -wait -log -nodesktop -nosplash -r "CombiSwitch_Constant; ip=getenv('mname');model_file=strtrim(ip);ret=UpdateMdl(model_file);pause(5);exit"
	goto return_value
)
IF %stage_num%==3 (
	%matlabpath% -wait -log -nodesktop -nosplash -r "ip=getenv('mname');model_file=strtrim(ip);ret=apply_config_setting(model_file,'New_config_setting');pause(5);exit"
	goto return_value
)
IF %stage_num%==4 (
	%matlabpath% -wait -log -nodesktop -nosplash -r "CombiSwitch_Constant; ip=getenv('mname');model_file=strtrim(ip);ret=Simmdl(model_file);pause(5);exit"
	goto return_value
)
IF %stage_num%==5 (
	%matlabpath% -wait -log -nodesktop -nosplash -r "CombiSwitch_Constant; ip=getenv('mname');model_file=strtrim(ip);ret=SLDV_verifier(model_file);pause(5);exit"
	goto return_value
)
IF %stage_num%==6 (
	%matlabpath% -wait -log -nodesktop -nosplash -r "CombiSwitch_Constant; ip=getenv('mname');model_file=strtrim(ip);ret=apply_advisory_setting(model_file);pause(5);exit"
	goto return_value
)
IF %stage_num%==7 (
	%matlabpath% -wait -log -nodesktop -nosplash -r "CombiSwitch_Constant; ip=getenv('mname');model_file=strtrim(ip);ret=TestCasesGenSLDV(model_file);pause(5);exit"
	goto return_value
)
IF %stage_num%==8 (
	%matlabpath% -wait -log -nodesktop -nosplash -r "CombiSwitch_Constant; ip=getenv('mname');model_file=strtrim(ip);ret=MIL_Testing(model_file,1);pause(5);exit"
	goto return_value
)
IF %stage_num%==9 (
	%matlabpath% -wait -log -nodesktop -nosplash -r "CombiSwitch_Constant; ip=getenv('mname');model_file=strtrim(ip);ret=SIL_Testing(model_file);pause(5);exit"
	goto return_value
)
IF %stage_num%==10 (
	%matlabpath% -wait -log -nodesktop -nosplash -r "CombiSwitch_Constant; ip=getenv('mname');model_file=strtrim(ip);ret=create_deviation_report(model_file);pause(5);exit"
	goto return_value
)

:return_value
echo %ERRORLEVEL%