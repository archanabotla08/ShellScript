#!/bin/bash -x
isPartTime=1;
isFullTime=2;
empRatePerHr=20;
totalSalary=0;
numWorkingDays=20
MAX_HRS_IN_MONTH=100;

while [[ $totalEmpHrs -lt $MAX_HRS_IN_MONTH && $totalWorkingDays -lt $numWorkingDays ]]
do
        ((totalWorkingDays++))
        empCheck=$((RANDOM%3))
        case $empCheck in
                $isFullTime )
                        empHrs=8
                        ;;
                $isPartTime )
                        empHrs=4
                        ;;
                * )
                        empHrs=0
                        ;;
        esac
        totalEmpHrs=$(($totalEmpHrs+$empHrs))
done
totalSalary=$(($totalEmpHrs*$empRatePerHr))

