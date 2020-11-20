function trace_plotter(trace_struct, no_of_traces, lin_log)
   
% here, we make a list of the requried size
traces_to_plot = zeros(1, no_of_traces); 

counter = 0;
% in this loop we have ensured that no random number is repeated. 
while counter < no_of_traces
    trace_no = randi([1 trace_struct.Ntraces]);
    %here we are checking if the tracenumber picked out has already been
    %used or not. 
    if ismember(trace_no, traces_to_plot)== 0
        %if not used, then we add the nunmber to the traces_to_plot list. 
        traces_to_plot(counter+1) = trace_no;
    end
    counter = counter+1;
end
 
if nargin == 3 
    %if the number of inputs to the function is 3, then that means that
    %'lin'/'log' has also been specified. 
    if strcmp(lin_log, 'log')==1
        plotter(trace_struct, traces_to_plot);
        set(gca, "YScale", 'log');
    end
    if strcmp(lin_log, 'lin')==1
        plotter(trace_struct, traces_to_plot);
    end
else
        figure();
        xlabel('Displacement (nm)');
        ylabel('Conductance G_0');
        hold on;
        for i = 1:length(traces_to_plot)
            trace = trace_struct.Traces{traces_to_plot(i)}; % here, we access the individual trace
            x_vals = trace(:, 1); % here we assign the x-values. 
            y_vals = trace(:, 2);% here we assign the y_values.
            plot(x_vals, y_vals);
        end
end
hold off; % after the loop has run, we hold off. 
end

function plotter(trace_struct,traces_to_plot)
        figure();
        xlabel('Displacement (nm)');
        ylabel('Conductance G_0');
        hold on;
        for i = 1:length(traces_to_plot)
            trace = trace_struct.Traces{traces_to_plot(i)}; % here, we access the individual trace
            x_vals = trace(:, 1); % here we assign the x-values. 
            y_vals = trace(:, 2);% here we assign the y_values.
            plot(x_vals, 10.^y_vals);
        end
end



    


