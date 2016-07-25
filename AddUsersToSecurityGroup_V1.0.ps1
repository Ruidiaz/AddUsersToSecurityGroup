#########################
#
# Script to add users to access profile based on CSV
#
# Will import settings from CSV and add users to profile
#
# Javier RUIDIAZ 23/07/2016 V0.1
#
#########################

Import-Module ActiveDirectory

#Import CSV
$CSV = import-csv "AddUsers.csv"

# Grab a list of all profiles that will be used later to remove a user from every profile
$ProfileList = Get-ADGroup -Filter * -SearchBase "OU=Access Profile Groups,OU=CPD - Project FIRST,OU=Local Security Groups,OU=LHS,OU=SITES,OU=CORPUK,OU=UK,OU=Countries,DC=emea,DC=loreal,DC=intra"

ForEach ($Line in $CSV){
	
	# Store name and group from CSV
	$Name = $Line."AD Name"
	
	$Group = $Line."Security Group Access Profile"

	
	#Sanitise and setup group name.
	#$Group = $Group.Trim()
	#$Group = $Group.replace("[","")
	#$Group = $Group.replace("]","")
	#$Group = $Group.replace(" ","_")
	#$Group = $Group.replace("_-_","-")
	
	
	#Check that the group to add the user to actually exists before removing all their other groups
	Try{
	
		$TestGroup = Get-ADGroup $Group

	}Catch{
	
		Write-Host "Can't find AD Group - $Group. Please check the group name" -ForegroundColor "Red"
	
	}

	
	# If testgroup ensures that the group we are going to add the user to actually exists
	If($TestGroup){
		
		# Need to remove all previous permission groups to make sure a user is only ever in one, otherwise they would get cumulative access.
		#Remove-ADPrincipalGroupMembership -Identity $Name -MemberOf $ProfileList -Confirm:$False
		
	
		# Add the user to the group for mapping the drive
		#Add-ADGroupMember -Identity CORPUK_CPD_DRIVE -Members $Name

		
		# Add the user to the group
		Write-Output "Adding " + $Name " to " + $Group
		Add-ADGroupMember -Identity $Group -Members $Name
		

	}
	
}