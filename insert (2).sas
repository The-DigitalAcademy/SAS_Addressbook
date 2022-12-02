%macro generate(id=,names=,email=,contact=,street_name=,house_number=,city=,postcode=,province=,search_count=);

%put id = &id;
%put names = &names;
%put email= &email;
%put contact = &contact;
%put street_name = &street_name;
%put house_number = &house_number;
%put city = &city;
%put postcode = &postcode;
%put province = &province;
%put search_count = &search_count;


data temp;
	id = &id;
	names = "&names";
	email= "&email";
	contact = "&contact";
	street_name = "&street_name";
	house_number = "&house_number";
	city = "&city";
	postcode = "&postcode";
	province = "&province";
	search_count = &search_count;

run;
%MEND generate;

%generate(id=9421,names=john_diale,email=john@gmail,contact=0764534263,street_name=lol,house_number=34,city=pretoria,postcode=0162,province=gauteng,search_count=0);

DATA All_details; 
   SET All_details temp;
PROC PRINT DATA = All_details; 
RUN;  
quit;

