%macro generate(id=,names=,email=,contact=,street_name=,house_number=,city=,postcode=,province=,search_count=);

%put id = &id;
%put names = &names;
%put email = &email;
%put contact = &contact;
%put street_name = &street_name;
%put house_number = &house_number;
%put city = &city;
%put postcode = &postcode;
%put province = &province;
%put search_count = &search_count;

data temp_2;
	id = &id;
	names = "&names";
	email = "&email";
	contact = "&contact";
	street_name = "&street_name";
	house_number = "&house_number";
	city = "&city";
	postcode = "&postcode";
	province = "&province";
	search_count = &search_count;
run;
%mend generate;

%generate (id=9421,names=john_diale,email=john@gmail.com,contact=0764534263,street_name=lol,house_number=34,city=pretoria,postcode=0152,province=Gauteng,search_count=0);


data All_details;
   modify All_details temp_2;                                  /* 1*/
      by id;
      select (_iorc_);                                             /* 2*/
   /*** The observation exists in the master data set   */ 
          when (%sysrc(_sok))do;                                   /* 3*/
             names = names;
             email = email;
             contact = contact;
             street_name = street_name;
             house_number = house_number;
             city = city;
             postcode = postcode;
             province = province;
             search_count = 0;
             replace;                                              /* 4*/
          end;
   /*** The observation does not exist in the master data set*/
          when (%sysrc(_dsenmr)) do;                               /* 5*/
             output;                                               /* 6*/
             _error_=0;
          end;
      otherwise do;                                                /* 7*/
         put "An unexpected I/O error has occurred."
         _error_ = 0; 
         stop;
      end;
   end; 
run; 
proc sort data=All_details; 
   by id; 
run;
proc print data=All_details;
   Title 'Updated details '&SYSDATE &SYSTIME;
run; 
quit;






