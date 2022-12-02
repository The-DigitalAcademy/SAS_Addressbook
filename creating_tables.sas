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


