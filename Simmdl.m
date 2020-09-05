%this file Simulate the model.
%Inputs:  None
%Outputs: None.
         
function [ret]=Simmdl(Model_Name)
try
	simOut = sim(Model_Name)  %  Error code generation 
	disp('Model Simulation completed successfully')
    ret = 0;
	exit(0);
	
catch
    disp('Error While simulating the model')
    ret = 1;
	exit(1);
end
end