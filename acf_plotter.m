%trace_struct is our actual data
%conductance is the conductance at which we want to find the correlation
%deviation is the range of acceptable conductance. 
%comparisons is the number of comparisons to perform. 
function acf_plotter(trace_struct, conductance, deviation, comparisons)

    %main_list will store the required conductance count for each breaking
    %trace. 
    main_list = zeros(1,trace_struct.Ntraces)
    
    %putting conductance data in a single matrix , first column is the trace
    %number and the second column is the conductance value. 
    ColumnData = zeros(trace_struct.NumTotalPoints, 2);
    counter = 0;
    for i = 1:trace_struct.Ntraces
        tr = trace_struct.Traces{i};
        n = size(tr,1);
        ColumnData(counter+1:counter+n, 1) = i;
        ColumnData(counter+1:counter+n, 2) = tr(:,2);
        counter = counter + n;
    end
    
    %this loop will iterate through ColumnData
    for i = 1:trace_struct.NumTotalPoints
        if conductance-deviation <= ColumnData(i,2) <= conductance+deviation
            %if the conductance we are looking at is in the requried range,
            %then we can increment the count of the value at the index =
            %trace_number
            main_list(ColumnData(i,1)) = main_list(ColumnData(i,1))+1
        end
    end
    
    %now we need to sum main_list, calculate the average and then subtract it from each element. 
    %to essentially create a new "balanced" main list. 
    sum = sum(main_list)
    avg = sum / length(main_list)
    main_list_balanced = main_list-avg
    
    %we will have a lag_list where index 1 will store correlation value for
    %lag1, index 2 will store correlation value for lag2 and so on. 
    %lag_list will be as long as the number of comparisons required. 
    
    lag_list = zeros(1, comparisons)
    
    
    
        
    end
    
    

    
    
    %lag_list = zeros(1,comparisons);
    
    
    
    
    