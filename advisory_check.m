%this file applies the advisory settings to the model and run it.
function [ret]=advisory_check(model_file)
try
    bdclose all
    waitbar_status  = waitbar(0, 'Please wait... Starting Model Advisory Checks');
    model_file = model_file(1:end-4);
    sel_req_chks = selected_checks();
    print_logdata(strcat('model name is: ',model_file));
    %model_file = 'odo_trip_demo';
    %new_config_file = 'new_advisory_settings.m';
    
    load_system(model_file);   
    
	print_logdata('Loading the Model')
    waitbar(1/4, waitbar_status, 'Please wait...Loading the Model');
	
    %Get model advisor object of the model
    ma = Simulink.ModelAdvisor.getModelAdvisor(model_file);
    
    %Close any model advisor report
    %setBaselineMode(ma,true)
    closeReport(ma);
    %Deselect All Checks/Tasks
    oc = deselectCheckAll(ma);
    %ot = deselectTaskAll(ma)
    selectCheck(ma,sel_req_chks)
    
    waitbar(2/4, waitbar_status, 'Please wait...Selecting Checks for Model');
       
    CheckIDs = getSelectedCheck(ma);

    %run the selected task
    print_logdata('Running Selected MAAB, ISO26262, MISRA C Advisory Checks on the Model')
	%ss = runTask(ma)
    ss = runCheck(ma,sel_req_chks);
    waitbar(3/4, waitbar_status, 'Please wait...Running Checks');

    %Generate Advisor Report
	print_logdata('Showing Advisory Checks Report')
    displayReport(ma);
    
    waitbar(4/4, waitbar_status, 'Please wait...Showing Advisory Checks Report');
    
    print_logdata('Advisory Settings Report Successfully Generated')
    
    close_system(model_file);
    
    ret = 0;
    close(waitbar_status);
catch
    close(waitbar_status);
    print_logdata('Error While Running Model Advisory Checks')
    ret = 1;

end
end


