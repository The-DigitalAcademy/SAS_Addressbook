

DATA details;
INPUT   id 1-4 names $ 5-18 email $ 19-40 contact $ 41-51;
DATALINES;
9420 linah_joseph linahjoseph@gmail.com 0713022320
9421 queen_latifa queenlatifa@gmail.com 0813456091
;
PROC PRINT DATA = details;
RUN;

DATA locations;
INPUT   id 1-4 street_name $ 5-18 house_number $ 19-22 city $ 23-32 postcode $ 33-37 province $ 38-50 search_count 51-59;
DATALINES;
9420 hellen_joseph 234 Cape_town 0157 Western_cape 0
9421 church_street 123 Polokwane 0737 Limpopo_prov 0
;
PROC PRINT DATA = locations;
RUN;

DATA All_details;
MERGE details locations;
BY id;
RUN;
PROC PRINT DATA = All_details; 
RUN; 

%macro generate(names=,email=,contact=,street_name=,house_number=,city=,postcode=,province=,search_count=);


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
data new_id;
	set All_details end=last;
	by id;
	if last;
	id = id + 1;
	keep id;
	run;

data new; 
	merge temp new_id;
run;

%MEND generate;

%generate(names=john_diale,email=john@gmail,contact=0764534263,street_name=lol,house_number=34,city=pretoria,postcode=0162,province=gauteng,search_count=0);

DATA All_details; 
   SET All_details new;
run;
PROC PRINT DATA = All_details; 
RUN;  
quit;