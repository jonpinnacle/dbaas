Import-Module FailoverClusters

Get-ClusterNode

 foreach ($node in Get-ClusterNode) {Enable-SqlAlwaysOn -ServerInstance $node -Force}