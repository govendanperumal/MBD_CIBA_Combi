%this file update the model.
%Inputs:  None
%Outputs: None.
         
function [ret]=UpdateMdl(Mdl_name)
try
	load_system(Mdl_name);		%Error code generation
	
	set_param(Mdl_name,'SimulationCommand','Update');
	disp('Model updation completed successfully')
	ret = 0;
	exit(0);
catch
    disp('Error While updating the model')
    ret = 1;
	exit(1);
end
end