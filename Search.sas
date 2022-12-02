%macro search(filter,x);
	%put x = &x;
	%put filter = &filter;
	
	%if &filter = house_number %then 
	 		%do;
	 			data All_details;
	 				set All_details;
	 				search_count = search_count + 1;
	 			run;
 				data result;
           			set All_details;
	    			where house_number = "&x";
	    			
	    		proc print data=result;
	    		run;
	    		
	    		
            %end; 
    %if &filter = postcode %then 
	 		%do;
	 			data All_details;
	 				set All_details;
	 				search_count = search_count + 1;
	 			run;
 				data result;
           			set All_details;
	    			where postcode = "&x";
	    		proc print data=result;
	    		run;
            %end;
     %if &filter = names %then 
	 		%do;
	 			data All_details;
	 				set All_details;
	 				search_count = search_count + 1;
	 			run;
 				data result;
           			set All_details;
	    			where names = "&x";
	    		proc print data=result;
	    		run;
            %end; 
    %if &filter = email %then 
	 		%do;
	 			data All_details;
	 				set All_details;
	 				search_count = search_count + 1;
	 			run;
 				data result;
           			set All_details;
	    			where email = "&x";
	    		proc print data=result;
	    		run;
            %end;
    %if &filter = street_name %then 
	 		%do;
	 			data All_details;
	 				set All_details;
	 				search_count = search_count + 1;
	 			run;
 				data result;
           			set All_details;
	    			where street_name = "&x";
	    		proc print data=result;
	    		run;
            %end; 
    %if &filter = contact %then 
	 		%do;
	 			data All_details;
	 				set All_details;
	 				search_count = search_count + 1;
	 			run;
 				data result;
           			set All_details;
	    			where contact = "&x";
	    		proc print data=result;
	    		run;
            %end;
    %if &filter = province %then 
	 		%do;
	 			data All_details;
	 				set All_details;
	 				search_count = search_count + 1;
	 			run;
 				data result;
           			set All_details;
	    			where province = "&x";
	    		proc print data=result;
	    		run;
            %end; 
    %if &filter = contact %then 
	 		%do;
	 			data All_details;
	 				set All_details;
	 				search_count = search_count + 1;
	 			run;
 				data result;
           			set All_details;
	    			where contact = "&x";
	    		proc print data=result;
	    		run;
            %end;
            
%mend search;

%search(postcode,0157);

