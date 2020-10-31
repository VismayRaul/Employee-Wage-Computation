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

while [[ $totalEmpHrs -lt $MAX_HRS && $totalWorkingDays -lt $MAX_WORKING_DAYS  ]]
do
((totalWorkingDays++))
empCheck=$((RANDOM%3))
	case $empCheck in
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
	totalEmpHrs=$(($totalEmpHrs+$empHrs))
done
totalsalary=$(($totalEmpHrs*$empRatePerHour))
