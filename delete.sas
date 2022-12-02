
%macro deleting(id);
	%put id= &id;
	
	data All_details;
    set All_details;
    if id = &id then delete;
	run;
	
	proc sort data= all_details;
	    by id;
	run;	
%mend delete;

%deleting(9420)


