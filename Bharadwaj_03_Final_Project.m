% Code Name: Bharadwaj_Final_Project
% Code Description: Commercial Aircraft Purchase
% Author: Anuranan Bharadwaj
% Email: bharada3@my.erau.edu
% Class: EGR115 - Section 3
% Date: 12/11/2022

clear
clc
close all

fprintf('Welcome! This program will assist you in purchasing aircrafts of your airline.\n')

%Constants
database_prof = 'YES'; %initialise
company_prof = 'YES'; %initialise

aircraft_type_Shaul = 'Short-Haul'; %initialise
aircraft_type_Mhaul = 'Medium-Haul'; %initialise
aircraft_type_Lhaul = 'Long-Haul'; %initialise

total_aircraft_cost = 0; %initialise for running total
repeat = 'Yes'; %initialise for the repeat loop

[Numbers,Strings,All_Data] = xlsread("FINAL_PROJECT.xlsx"); %<SM:READ> %importing file from Excel to MATLAB

database = input('Do you want to view the database of plane manufacturing companies (YES or NO)? ','s'); %user input
while isempty(database) || strcmpi(database, 'YES')==0 && strcmpi(database, 'NO')==0 %<SM:ROP> %<SM:BOP> %<SM:WHILE> %error check
    database = input('Error. Do you want to view the database of plane manufacturing companies (YES or NO)? ','s');
end

while strcmpi(repeat,'Yes') == 1 && strcmpi(database,database_prof) == 1 %<SM:IF> %<SM:STRING> %string compare

    company = input('Do you know which manufacturer to buy from (YES or NO)? ','s'); %user input
    while isempty(company) || strcmpi(company, 'YES')==0 && strcmpi(company, 'NO')==0 %<SM:ROP> %<SM:BOP> %<SM:WHILE> %error check
        company = input('Error. Do you know which manufacturer to buy from (YES or NO)? ','s');
    end

    if strcmpi(company,company_prof) == 1 %<SM:IF> %<SM:STRING> %string compare
        aircraft_type = input('What type of aircraft you want to purchase (Short-Haul/Medium-Haul/Long-Haul)? ','s'); %user type
        while isempty(aircraft_type) || strcmpi(aircraft_type, 'Short-Haul')==0 && strcmpi(aircraft_type, 'Medium-Haul')==0 && strcmpi(aircraft_type, 'Long-Haul')==0 %<SM:ROP> %<SM:BOP> %<SM:WHILE> %error check
            aircraft_type = input('What type of aircraft you want to purchase (Short-Haul/Medium-Haul/Long-Haul)? ','s');
        end

        if strcmpi(aircraft_type,aircraft_type_Shaul) == 1 %<SM:IF> %<SM:NEST> %<SM:STRING> %string compare
            manufacturer = input('Which manufacturer you want to purchase aircrafts from (Boeing/Airbus/Bombardier)? ','s'); %user input
            while isempty(manufacturer) || strcmpi(manufacturer, 'Boeing')==0 && strcmpi(manufacturer, 'Airbus')==0 && strcmpi(manufacturer, 'Bombardier')==0 %<SM:ROP> %<SM:BOP> %<SM:WHILE> %error check
                manufacturer = input('Which manufacturer you want to purchase aircrafts from (Boeing/Airbus/Bombardier)? ','s');
            end

            if strcmpi(manufacturer,'Boeing') == 1 %<SM:NEST>

                BoeingModels_shorthaul = {'737 MAX';'737-600';'737-700';'737-700ER';'737-800';'737-900'};
                Price1 = char({'121.6 million';'50 million';'90 million';'35 million';'106.1 million';'94.6 million'});
                T1 = table(Price1,'RowNames',BoeingModels_shorthaul); %<SM:NEWFUN>
                disp(T1)

                n_aircrafts = input('How many aircrafts you want to purchase? ' ); %user input
                while isempty(n_aircrafts) || n_aircrafts <0 || mod(n_aircrafts,1) ~=0
                    n_aircrafts = input('How many aircrafts you want to purchase? ');
                end

                for k = 1:n_aircrafts %<SM:FOR> %for loop for number of aircrafts(Short-Haul)
                    fprintf('Aircraft #%.f: \n', k);
                    model_Shaul = input('Which aircraft model you want to purchase? ' ,'s');

                    found = 0;
                    for i = 1:length(All_Data) %<SM:FOR> %<SM:SLICE> %number of rows in All_Data
                        if strcmpi(model_Shaul,All_Data{i,2}) == 1 %<SM:AUG> %<SM:STRING> %parameter
                            price = All_Data{i,3}; %<SM:SLICE> %variable to store above parameter
                            found = 1;
                        end
                    end

                    while isempty(model_Shaul) || found == 0
                        model_Shaul = input('Which aircraft model you want to purchase? ' ,'s');

                        found = 0;
                        for i = 1:length(All_Data) %<SM:FOR> %<SM:SLICE> %number of rows in All_Data
                            if strcmpi(model_Shaul,All_Data{i,2}) == 1 %<SM:AUG> %<SM:STRING> %parameter
                                price = All_Data{i,3}; %<SM:SLICE> %variable to store above parameter
                                found = 1;
                            end
                        end
                    end
                    total_aircraft_cost = total_aircraft_cost + price;  %<SM:RTOTAL>
                end


            elseif strcmpi(manufacturer,'Airbus') == 1

                AirbusModels_shorthaul = {'A320';'A320neo';'A321neo';'A321XLR';'A320ceo';'A321ceo'};
                Price2 = char({'46.45 million';'110.6 million';'118.3 million';'120 million';'101 million';'129.5million'});
                T2 = table(Price2,'RowNames',AirbusModels_shorthaul); %<SM:NEWFUN>
                disp(T2)

                n_aircrafts = input('How many aircrafts you want to purchase? ' ); %user input
                while isempty(n_aircrafts) || n_aircrafts <0 || mod(n_aircrafts,1) ~=0
                    n_aircrafts = input('How many aircrafts you want to purchase? ' );
                end

                for k = 1:n_aircrafts %<SM:FOR> %for loop for number of aircrafts(Short-Haul)
                    fprintf('Aircraft #%.f: \n', k);
                    model_Shaul = input('Which aircraft model you want to purchase? ' ,'s');

                    found = 0;
                    for i = 1:length(All_Data) %<SM:FOR> %<SM:SLICE> %number of rows in All_Data
                        if strcmpi(model_Shaul,All_Data{i,2}) == 1 %<SM:AUG> %<SM:STRING> %parameter
                            price = All_Data{i,3}; %<SM:SLICE> %variable to store above parameter
                            found = 1;
                        end
                    end

                    while isempty(model_Shaul) || found == 0
                        model_Shaul = input('Which aircraft model you want to purchase? ' ,'s');

                        found = 0;
                        for i = 1:length(All_Data) %<SM:FOR> %<SM:SLICE> %number of rows in All_Data
                            if strcmpi(model_Shaul,All_Data{i,2}) == 1 %<SM:AUG> %<SM:STRING> %parameter
                                price = All_Data{i,3}; %<SM:SLICE> %variable to store above parameter
                                found = 1;
                            end
                        end
                    end

                    total_aircraft_cost = total_aircraft_cost + price;  %<SM:RTOTAL>
                end


            elseif strcmpi(manufacturer,'Bombardier') == 1

                BombardierModels_shorthaul = {'CRJ200';'CRJ700';'CRJ900'};
                Price3 = char({'27 million';'24.39 million';'33.6 million'});
                T3 = table(Price3,'RowNames',BombardierModels_shorthaul); %<SM:NEWFUN>
                disp(T3)

                n_aircrafts = input('How many aircrafts you want to purchase? ' ); %user input
                while isempty(n_aircrafts) || n_aircrafts <0 || mod(n_aircrafts,1) ~=0
                    n_aircrafts = input('How many aircrafts you want to purchase? ' );
                end

                for k = 1:n_aircrafts %<SM:FOR> %for loop for number of aircrafts(Short-Haul)
                    fprintf('Aircraft #%.f: \n', k);
                    model_Shaul = input('Which aircraft model you want to purchase? ' ,'s');

                    found = 0;
                    for i = 1:length(All_Data) %<SM:FOR> %<SM:SLICE> %number of rows in All_Data
                        if strcmpi(model_Shaul,All_Data{i,2}) == 1 %<SM:AUG> %<SM:STRING> %parameter
                            price = All_Data{i,3}; %<SM:SLICE> %variable to store above parameter
                            found = 1;
                        end
                    end

                    while isempty(model_Shaul) || found == 0
                        model_Shaul = input('Which aircraft model you want to purchase? ' ,'s');

                        for i = 1:length(All_Data) %<SM:FOR> %<SM:SLICE> %number of rows in All_Data
                            if strcmpi(model_Shaul,All_Data{i,2}) == 1 %<SM:AUG> %<SM:STRING> %parameter
                                price = All_Data{i,3}; %<SM:SLICE> %variable to store above parameter
                                found = 1;
                            end
                        end
                    end
                    total_aircraft_cost = total_aircraft_cost + price;  %<SM:RTOTAL>
                end
            end



        elseif strcmpi(aircraft_type,aircraft_type_Mhaul) == 1 %<SM:IF> %<SM:STRING> %string compare

            BoeingModels_mediumhaul = {'787-8';'787-9';'787-10';'757-200';'757-200PF';'757-200M';'757-300';'767-200'};
            Price4 = char({'239 million';'243.6 million';'292.5 million';'220.1 million';'200 million';'240.36 million';'222.9 million';'125.96 million'});
            T4 = table(Price4,'RowNames',BoeingModels_mediumhaul); %<SM:NEWFUN>
            disp(T4)

            n_aircrafts = input('How many aircrafts you want to purchase? ' ); %user input
            while isempty(n_aircrafts) || n_aircrafts <0 || mod(n_aircrafts,1) ~=0
                n_aircrafts = input('How many aircrafts you want to purchase? ' );
            end

            for k = 1:n_aircrafts %<SM:FOR> %<SM:FOR> %for loop for number of aircrafts(Medium-Haul)
                fprintf('Aircraft #%.f: \n', k);
                model_Mhaul = input('Which aircraft model you want to purchase? ' ,'s');

                found = 0;
                for i = 1:length(All_Data) %<SM:FOR> %<SM:SLICE> %number of rows in All_Data
                    if strcmpi(model_Mhaul,All_Data{i,5}) == 1 %<SM:AUG> %<SM:STRING> %parameter
                        price = All_Data{i,6}; %<SM:SLICE> %variable to store above parameter
                        found = 1;
                    end
                end

                while isempty(model_Mhaul) || found == 0
                    model_Mhaul = input('Which aircraft model you want to purchase? ' ,'s');

                    for i = 1:length(All_Data) %<SM:FOR> %<SM:SLICE> %number of rows in All_Data
                        if strcmpi(model_Mhaul,All_Data{i,5}) == 1 %<SM:AUG> %<SM:STRING> %parameter
                            price = All_Data{i,6}; %<SM:SLICE> %variable to store above parameter
                            found = 1;
                        end
                    end
                end

                total_aircraft_cost = total_aircraft_cost + price;  %<SM:RTOTAL>

            end


        elseif strcmpi(aircraft_type,aircraft_type_Lhaul) == 1 %<SM:IF> %<SM:STRING> %string compare
            manufacturer = input('Which manufacturer you want to purchase aircrafts from (Boeing/Airbus)? ','s'); %user input
            while isempty(manufacturer) || strcmpi(manufacturer, 'Boeing')==0 && strcmpi(manufacturer, 'Airbus')==0 %<SM:ROP> %<SM:BOP> %<SM:WHILE> %error check
                manufacturer = input('Which manufacturer you want to purchase aircrafts from (Boeing/Airbus/Bombardier)? ','s');
            end

            if strcmpi(manufacturer,'Boeing') == 1

                BoeingModels_longhaul = {'777-200';'777-200ER';'777-300';'747-100';'747-100B';'747-200';'747-400'};
                Price5 = char({'290 million';'306.6 million';'100 million';'160 million';'182 million';'192 million';'418.4 million'});
                T5 = table(Price5,'RowNames',BoeingModels_longhaul); %<SM:NEWFUN>
                disp(T5)

                n_aircrafts = input('How many aircrafts you want to purchase? ' ); %user input
                while isempty(n_aircrafts) || n_aircrafts <0 || mod(n_aircrafts,1) ~=0
                    n_aircrafts = input('How many aircrafts you want to purchase? ' );
                end

                for k = 1:n_aircrafts %<SM:FOR> %for loop for number of aircrafts(Long-Haul)
                    fprintf('Aircraft #%.f: \n', k);
                    model_Lhaul = input('Which aircraft model you want to purchase? ' ,'s');

                    found = 0;
                    for i = 1:length(All_Data) %<SM:FOR> %<SM:SLICE> %number of rows in All_Data
                        if strcmpi(model_Lhaul,All_Data{i,8}) == 1 %<SM:AUG> %<SM:STRING> %parameter
                            price = All_Data{i,9}; %<SM:SLICE> %variable to store above parameter
                            found = 1;
                        end
                    end

                    while isempty(model_Lhaul) || found == 0
                        model_Lhaul = input('Which aircraft model you want to purchase? ' ,'s');

                        for i = 1:length(All_Data) %<SM:FOR> %<SM:SLICE> %number of rows in All_Data
                            if strcmpi(model_Lhaul,All_Data{i,8}) == 1 %<SM:AUG> %<SM:STRING> %parameter
                                price = All_Data{i,9}; %<SM:SLICE> %variable to store above parameter
                                found = 1;
                            end
                        end
                    end
                    total_aircraft_cost = total_aircraft_cost + price;  %<SM:RTOTAL>

                end

            elseif strcmpi(manufacturer,'Airbus') == 1
                AirbusModels_longhaul = {'A340-200';'A340-300';'A350-900';'A350-1000';'A380-800'};
                Price6 = char({'191 million';'350 million';'308.1 million';'355.7 million';'450 million'});
                T6 = table(Price6,'RowNames',AirbusModels_longhaul); %<SM:NEWFUN>
                disp(T6)

                n_aircrafts = input('How many aircrafts you want to purchase? ' ); %user input
                while isempty(n_aircrafts) || n_aircrafts <0 || mod(n_aircrafts,1) ~=0
                    n_aircrafts = input('How many aircrafts you want to purchase? ' );
                end

                for k = 1:n_aircrafts %<SM:FOR> %for loop for number of aircrafts(Long-Haul)
                    fprintf('Aircraft #%.f: \n', k);
                    model_Lhaul = input('Which aircraft model you want to purchase? ' ,'s');

                    found = 0;
                    for i = 1:length(All_Data) %<SM:FOR> %<SM:SLICE> %number of rows in All_Data
                        if strcmpi(model_Lhaul,All_Data{i,8}) == 1 %<SM:AUG> %<SM:STRING> %parameter
                            price = All_Data{i,9}; %<SM:SLICE> %variable to store above parameter
                            found = 1;
                        end
                    end

                    while isempty(model_Lhaul) || found == 0
                        model_Lhaul = input('Which aircraft model you want to purchase? ' ,'s');

                        for i = 1:length(All_Data) %<SM:FOR> %<SM:SLICE> %number of rows in All_Data
                            if strcmpi(model_Lhaul,All_Data{i,8}) == 1 %<SM:AUG> %<SM:STRING> %parameter
                                price = All_Data{i,9}; %<SM:SLICE> %variable to store above parameter
                                found = 1;
                            end
                        end
                    end
                    total_aircraft_cost = total_aircraft_cost + price;  %<SM:RTOTAL>

                end
            end
        end


    elseif strcmpi(company,company_prof) == 0 %<SM:IF> %<SM:STRING> %string compare
        aircraft_type = input('What type of aircraft you want to purchase (Short-Haul/Medium-Haul/Long-Haul)? ','s'); %user input
        while isempty(aircraft_type) || strcmpi(aircraft_type, 'Short-Haul')==0 && strcmpi(aircraft_type, 'Medium-Haul')==0 && strcmpi(aircraft_type, 'Long-Haul')==0 %<SM:ROP> %<SM:BOP> %<SM:WHILE> %error check
            aircraft_type = input('What type of aircraft you want to purchase (Short-Haul/Medium-Haul/Long-Haul)? ','s');
        end

        if strcmpi(aircraft_type,aircraft_type_Shaul) == 1 %<SM:IF> %<SM:STRING> %string compare
            Short_Haul_Price_Boeing = Numbers(1:6,1); %<SM:SLICE>
            Short_Haul_Price_Airbus = Numbers(7:12,1); %<SM:SLICE>
            Short_Haul_Price_Bombardier = Numbers(13:15,1); %<SM:SLICE>

            label1 = categorical({'737 MAX','737-600','737-700','737-700ER','737-800','737-900'}); %<SM:NEWFUN>
            subplot(3,1,1) %cost vs models plot for Short-Haul Boeing aircrafts
            bar(label1,Short_Haul_Price_Boeing, 'red') %<SM:PLOT>
            xlabel('Models(Boeing)')
            ylabel('Cost (million dollars)')
            ylim([(min(Short_Haul_Price_Boeing)-25) (max(Short_Haul_Price_Boeing)+50)])

            label2 = categorical({'A320','A320neo','A321neo','A321XLR','A320ceo','A321ceo'}); %<SM:NEWFUN>
            subplot(3,1,2) %cost vs models plot for Short-Haul Airbus aircrafts
            bar(label2,Short_Haul_Price_Airbus,'blue') %<SM:PLOT>
            xlabel('Models(Airbus)')
            ylabel('Cost (million dollars)')
            ylim([(min(Short_Haul_Price_Airbus)-50) (max(Short_Haul_Price_Airbus)+50)])

            label3 = categorical({'CRJ200','CRJ700','CRJ900'}); %<SM:NEWFUN>
            subplot(3,1,3) %cost vs models plot for Short-Haul Bombardier aircrafts
            bar(label3,Short_Haul_Price_Bombardier,'green') %<SM:PLOT>
            xlabel('Models(Bombardier)')
            ylabel('Cost (million dollars)')
            ylim([(min(Short_Haul_Price_Bombardier)-25) (max(Short_Haul_Price_Bombardier)+50)])
            drawnow

            manufacturer = input('Which manufacturer you want to purchase aircrafts from (Boeing/Airbus/Bombardier)? ','s'); %user input
            while isempty(manufacturer) || strcmpi(manufacturer, 'Boeing')==0 && strcmpi(manufacturer, 'Airbus')==0 && strcmpi(manufacturer, 'Bombardier')==0 %<SM:ROP> %<SM:BOP> %<SM:WHILE> %error check
                manufacturer = input('Which manufacturer you want to purchase aircrafts from (Boeing/Airbus/Bombardier)? ','s');
            end
            n_aircrafts = input('How many aircrafts you want to purchase? ' ); %user input
            while isempty(n_aircrafts) || n_aircrafts <0 || mod(n_aircrafts,1) ~=0
                n_aircrafts = input('How many aircrafts you want to purchase? ' );
            end

            for k = 1:n_aircrafts %<SM:FOR>
                fprintf('Aircraft #%.f: \n', k);
                model_Shaul = input('Which aircraft model you want to purchase? ' ,'s');

                found = 0;
                for i = 1:length(All_Data) %<SM:FOR> %<SM:SLICE>
                    if strcmpi(model_Shaul,All_Data{i,2}) == 1 %<SM:AUG> %<SM:STRING>
                        price = All_Data{i,3}; %<SM:SLICE>
                        found = 1;
                    end
                end

                while isempty(model_Shaul) || found == 0
                    model_Shaul = input('Which aircraft model you want to purchase? ' ,'s');

                    for i = 1:length(All_Data) %<SM:FOR> %<SM:SLICE>
                        if strcmpi(model_Shaul,All_Data{i,2}) == 1 %<SM:AUG> %<SM:STRING>
                            price = All_Data{i,3}; %<SM:SLICE>
                            found = 1;
                        end
                    end
                end

                total_aircraft_cost = total_aircraft_cost + price;  %<SM:RTOTAL>

            end


        elseif strcmpi(aircraft_type,aircraft_type_Mhaul) == 1 %<SM:IF> %<SM:STRING> %string compare
            Medium_Haul_Price_Boeing = Numbers(1:8,4); %<SM:SLICE>

            label4 = categorical({'787-8','787-9','787-10','757-200','757-200PF','757-200M','757-300','767-200'}); %<SM:NEWFUN>
            bar(label4,Medium_Haul_Price_Boeing,'red') %<SM:PLOT> %cost vs models plot for Medium-Haul Boeing aircrafts
            xlabel('Medium-Haul Models(Boeing)')
            ylabel('Cost (million dollars)')
            ylim([(min(Medium_Haul_Price_Boeing)-25) (max(Medium_Haul_Price_Boeing)+25)])
            drawnow

            n_aircrafts = input('How many aircrafts you want to purchase? ' ); %user input
            while isempty(n_aircrafts) || n_aircrafts <0 || mod(n_aircrafts,1) ~=0
                n_aircrafts = input('How many aircrafts you want to purchase? ' );
            end

            for k = 1:n_aircrafts %<SM:FOR>
                fprintf('Aircraft #%.f: \n', k);
                model_Mhaul = input('Which aircraft model you want to purchase? ' ,'s');

                found = 0;
                for i = 1:length(All_Data) %<SM:FOR> %<SM:SLICE>
                    if strcmpi(model_Mhaul,All_Data{i,5}) == 1 %<SM:AUG> %<SM:STRING>
                        price = All_Data{i,6}; %<SM:SLICE>
                        found = 1;
                    end
                end

                while isempty(model_Mhaul) || found == 0
                    model_Mhaul = input('Which aircraft model you want to purchase? ' ,'s');

                    for i = 1:length(All_Data) %<SM:FOR> %<SM:SLICE>
                        if strcmpi(model_Mhaul,All_Data{i,5}) == 1 %<SM:AUG> %<SM:STRING>
                            price = All_Data{i,6}; %<SM:SLICE>
                            found = 1;
                        end
                    end
                end

                total_aircraft_cost = total_aircraft_cost + price;  %<SM:RTOTAL>
            end


        elseif strcmpi(aircraft_type,aircraft_type_Lhaul) == 1 %<SM:IF> %<SM:STRING> %String compare
            Long_Haul_Price_Boeing = Numbers(1:7,7); %<SM:SLICE>
            Long_Haul_Price_Airbus = Numbers(8:12,7); %<SM:SLICE>

            label5 = categorical({'777-200','777-200ER','777-300','747-100','747-100B','747-200','747-400'}); %<SM:NEWFUN>
            subplot(2,1,1) %cost vs models plot for Long-Haul Boeing aircrafts
            bar(label5,Long_Haul_Price_Boeing, 'red') %<SM:PLOT>
            xlabel('Long-Haul Models(Boeing)')
            ylabel('Cost (million dollars)')
            ylim([(min(Long_Haul_Price_Boeing)-100) (max(Long_Haul_Price_Boeing)+100)])

            label6 = categorical({'A340-200','A340-300','A350-900','A350-1000','A380-800'}); %<SM:NEWFUN>
            subplot(2,1,2) %cost vs models plot for Long-Haul Airbus aircrafts
            bar(label6,Long_Haul_Price_Airbus,'blue') %<SM:PLOT>
            xlabel('Long-Haul Models(Airbus)')
            ylabel('Cost (million dollars)')
            ylim([(min(Long_Haul_Price_Airbus)-100) (max(Long_Haul_Price_Airbus)+100)])
            drawnow

            manufacturer = input('Which manufacturer you want to purchase aircrafts from (Boeing/Airbus)? ','s'); %user input
            while isempty(manufacturer) || strcmpi(manufacturer, 'Boeing')==0 && strcmpi(manufacturer, 'Airbus')==0 %<SM:ROP> %<SM:BOP> %<SM:WHILE> %error check
                manufacturer = input('Which manufacturer you want to purchase aircrafts from (Boeing/Airbus/Bombardier)? ','s');
            end

            n_aircrafts = input('How many aircrafts you want to purchase? ' ); %user input
            while isempty(n_aircrafts) || n_aircrafts <0 || mod(n_aircrafts,1) ~=0
                n_aircrafts = input('How many aircrafts you want to purchase? ' );
            end

            for k = 1:n_aircrafts %<SM:FOR>
                fprintf('Aircraft #%.f: \n', k);
                model_Lhaul = input('Which aircraft model you want to purchase? ' ,'s');

                found = 0;
                for i = 1:length(All_Data) %<SM:FOR> %<SM:SLICE>
                    if strcmpi(model_Lhaul,All_Data{i,8}) == 1 %<SM:AUG> %<SM:STRING>
                        price = All_Data{i,9}; %<SM:SLICE>
                        found = 1;
                    end
                end

                while isempty(model_Lhaul) || found == 0
                    model_Lhaul = input('Which aircraft model you want to purchase? ' ,'s');

                    for i = 1:length(All_Data) %<SM:FOR> %<SM:SLICE>
                        if strcmpi(model_Lhaul,All_Data{i,8}) == 1 %<SM:AUG> %<SM:STRING>
                            price = All_Data{i,9}; %<SM:SLICE>
                            found = 1;
                        end
                    end
                end

                total_aircraft_cost = total_aircraft_cost + price;  %<SM:RTOTAL>
            end
        end
    end

    discount = discount_PDF(n_aircrafts); %<SM:PDF>

    money_saved = total_aircraft_cost*discount/100; %<SM:RANDUSE> %money saved if user gets discount
    total_cost_before_taxes = total_aircraft_cost-money_saved; %<SM:RANDUSE>
    final_cost_with_taxes = total_cost_before_taxes*1.065;

    fprintf('\tDiscount: %.2f%% \n', discount); %<SM:RANDUSE> %output for discount (percentage)
    fprintf('\tThe final cost of your aircraft purchase order is $%.2f million \n', final_cost_with_taxes); %output for final cost order
    fprintf('\tYou saved $%.2f million \n', money_saved); %<SM:RANDUSE> %output for money saved (U.S. Dollars)

    repeat = input('Would you like to repeat the code? (Enter Yes or No): ', 's'); %user input
    while isempty(repeat) || strcmpi(repeat, 'Yes')==0 && strcmpi(repeat, 'No')==0 %<SM:ROP> %<SM:BOP> %<SM:WHILE> %error check
        repeat = input('Would you like to repeat the code? (Enter Yes or No): ', 's');
    end
end