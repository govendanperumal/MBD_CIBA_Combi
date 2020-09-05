%this file applies the advisory settings to the model and run it.
function [ret]=apply_advisory_setting(Model_Name)
try
    bdclose all
    
    model_file = Model_Name;	%Error code generation

    
    load_system(model_file);   
    disp('..')
    disp('..')
    
	disp('Applying Advisory Settings to the Model')
	
    %Get model advisor object of the model
    ma = Simulink.ModelAdvisor.getModelAdvisor(model_file);
	disp('..')
    disp('..')
    %Close any model advisor report
    closeReport(ma);
    %Deselect All Checks/Tasks
    oc = deselectCheckAll(ma);
    ot = deselectTaskAll(ma);
    %Get all the Tasks ID.
    taskids=getTaskAll(ma);
    %Select Task to run advisor
	disp('Selecting Advisory Settings for the Model- MAAB, JMAAB, MISRA C check')
    select_Task = selectTask(ma, {'_SYSTEM_By Task_MAAB Simulink','_SYSTEM_By Task_JMAAB Simulink','_SYSTEM_By Task_misra_c','_SYSTEM_By Task_CERT-C Simulink'});
	disp('..')
    disp('..')
    %run the selected task
    disp('Running Advisory Checks on the Model')
	ss = runTask(ma);
	disp('..')
    disp('..')
    %Generate Advisor Report
	disp('Showing Advisory Checks Report')
    displayReport(ma);
    %save the model
    save_system(model_file);
  
    disp('..')
    disp('..')
    
    close_system(model_file);
	disp('Advisory settings applied successfully')
    
    ret = 0;
	exit(0);
catch
    disp('Error While applying the Advisory Settings to the Model')
    ret = 1;
	exit(1);
end
end