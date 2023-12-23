**FAQ-1 - Wrong content being copied**

There are a handful of students who had difficultly copying data from **https://github.com.** The copy activity sometimes pulled the HTML page rather than the CSV file being requested to be copied across.

This was resolved by using sourceBaseURL as **https://raw.githubusercontent.com** rather than https://github.com. So, please use the URL **https://raw.githubusercontent.com** if you come across this issue. Also ensure that the RelativeUrl is also changed to remove "raw" as below

**BaseUrl** - https://raw.githubusercontent.com

**RelativeUrl** for each of the file will be

cloudboxacademy/covid19/main/ecdc_data/cases_deaths.csv

cloudboxacademy/covid19/main/ecdc_data/hospital_admissions.csv

cloudboxacademy/covid19/main/ecdc_data/testing.csv

cloudboxacademy/covid19/main/ecdc_data/country_response.csv