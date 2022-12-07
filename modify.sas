%macro modify(id=,names=,email=,contact=,street_name=,house_number=,city=,postcode=,province=,search_count=);
	%do;
		data All_details;
			modify work.All_details;
			names = "&names";
			email = "&email";
			contact = "&contact";
			street_name = "&street_name";
			house_number = "&house_number";
			city = "&city";
			postcode = "&postcode";
			province = "&province";
			search_count = &search_count;
			
			where id = &id;
		run;
	%end;
	
	proc print data = All_details; 
	run;  
%mend modify;

%modify(id=9421,names=john_diale,email=john@gmail.com,contact=0764534263,street_name=lol,house_number=34,city=pretoria,postcode=0152,province=Gauteng,search_count=0);








