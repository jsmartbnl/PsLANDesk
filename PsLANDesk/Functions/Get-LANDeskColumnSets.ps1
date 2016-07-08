Function Get-LANDeskColumnSet 
{
	<#	
		.SYNOPSIS
			The Get-LANDeskColumnSets function returns a list of available Column sets.
		
		.DESCRIPTION
			The Get-LANDeskColumnSets function returns a list of available Column sets. This can be used to determine the columns available to each set.
		
		.PARAMETER ID
			The ID of the task to check the status on.

		.EXAMPLE
			Get-LANDeskColumnSets 
			
			Returns a list of available column sets.
						
	#>
	[CmdletBinding()]
	param
	()
	Begin
	{
        $BeginEA = $ErrorActionPreference
        $ErrorActionPreference = "Stop"
		If(!($LANDeskWebService))
		{
			Write-Warning -Message "An active connection to the LANDesk Web Service was not found. Will attempt to connect"
			Try
            {
                Write-Verbose "Connecting to LANDesk server."
                Connect-LANDeskServer
            }
            Catch
            {
                $ErrorActionPreference = $BeginEA
                Write-Error "Could not connect to LANDesk server"
                break
            }
		}
        $ErrorActionPreference = $BeginEA	
	}
	Process 
	{
		$LANDeskWebService.ListColumnSets().ColumnSets
	}
	End{}
}