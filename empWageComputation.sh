#!/bin/bash -x
isPartTime=1;
isFullTime=2;
empRatePerHr=20;
totalSalary=0;
numWorkingDays=20
MAX_HRS_IN_MONTH=100;
totalEmpHrs=0;
totalWorkingDays=0;

declare -A dailyWage
function getWorkHrs()
{
        case $1 in
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
        echo $empHrs
}

function getEmpWage()
{
        local empHr=$1;
        echo $(( $empHr * $empRatePerHr ))

}

while [[ $totalEmpHrs -lt $MAX_HRS_IN_MONTH && $totalWorkingDays -lt $numWorkingDays ]]
do
        ((totalWorkingDays++))
        empCheck=$(( RANDOM%3 ))
        empHrs="$( getWorkHrs $empCheck )"
        totalEmpHours=$(( $totalEmpHrs+$empHrs ))
	dailyWage["Day $totalWorkingDays"]="$( getEmpWage $empHrs )"
done
totalSalary=$(( $totalEmpHours*$empRatePerHr ))
echo ${dailyWage[@]}
echo ${!dailyWage[@]}
for i in "${!dailyWage[@]}"
do
        echo $i ":" ${dailyWage[$i]}
done

