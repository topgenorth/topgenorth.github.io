--- 
date: "2011-03-01T00:00:00Z" 
status: publish 
categories: 
    - Programming 
title: Purging your Privates (MSMQ with Powershell) 
type: post 

--- A project I’m currently on makes heavy use of MSMQ and private queues.  Every so often, it’s necessary to purge messages from the queue during development. I got tired of always using the MMC snap-in to perform this task, so I whipped up this quick PowerShell script to handle the dirty work for me.  Granted, it’s pretty crude, but it gets the job done.  Any suggestions or improvements, feel free to let me know.

```powershell
$queuename = ".\private$\myprivatequeue"
[Reflection.Assembly]::LoadWithPartialName("System.Messaging") | Out-Null 
$queue = New-Object -TypeName "System.Messaging.MessageQueue"
$queue.Path = $queuename
$messagecount = $queue.GetAllMessages().Length 
$queue.Purge() 
Write-Host "$queuename has been purged of $messagecount messages." -ForegroundColor Yellow
```
