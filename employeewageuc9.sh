#!/bin/bash -x

isFullTime=1
isPartTime=2
empRatePerHour=20
numbWorkingDays=20
#totalsalary=0
MAX_HRS=10
MAX_WORKING_DAYS=20

totalEmpHrs=0
totalWorkingDays=0

declare -A dailyWageArray

function getWorkingDays
{
         case $1 in
                $isFullTime)
                empHrs=8
                ;;

                $isPartTime)
                empHrs=4
                ;;
                *)
                empHrs=0
                ;;
        esac
        echo $empHrs

}

while [[ $totalEmpHrs -lt $MAX_HRS && $totalWorkingDays -lt $MAX_WORKING_DAYS  ]]
do
        ((totalWorkingDays++))
        randomCheck=$((RANDOM%3))
        empHrs="$( getWorkingDays $randomCheck )"
        dailyWage=$(($empHrs*$empRatePerHour))
        dailyWageArray["Day"$totalWorkingDays]=$dailyWage
        totalEmpHrs=$(($totalEmpHrs+$empHrs))
done
totalsalary=$(($totalEmpHrs*$empRatePerHour))
echo "dailyWage array elements:" ${dailyWageArray[@]}
echo "dailyWage index positions for array:" ${!dailyWageArray[@]}
