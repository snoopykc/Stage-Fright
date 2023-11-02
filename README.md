Stage-Fright is a project of mine to solve the issue of having to move individual computer objects to their corrosponding OU's after imaging via SCCM. Ideally, I will turn this into an SCCM task in our task sequence at some point to completely eliminate the need for a staging OU.

In our enviroment, we have over 30 buildings, each with their own naming scheme, each building has at least 4 sub-OU's for laptops, surfaces, workstations, etc. It was a daily task of mine to move each Computer unit to their corrosponding OU. This was one of the most time consuming parts of my day as our field techs would image a minimum of 10 machines across our enviroment daily.

This script will move all machines in a targetted OU to the correct OU's based on machine name through the use of If-elseif statements. You will need to expand/reduce this script based on your needs. Our version is well over 2000 lines.
