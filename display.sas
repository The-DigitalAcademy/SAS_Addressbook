%macro display_details(values);
%put values= &values;

data result;
	set All_details;
	where id = &values;
proc print data=result;
run;
%mend display_details;

%display_details(9421)