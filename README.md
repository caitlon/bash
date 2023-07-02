# Repository Description

This repository contains a collection of bash scripts aimed to perform various tasks on the `fray1` server. Below are brief explanations of each script.


### Script 1: File Creation with Variable Name

This script creates a file on the server `fray1` in the directory named *tyden09*, which was created in the first task. 
The name of the file will be set based on the content of the variable UID.

### Script 2: Selecting Users from Database

This script selects users from the `fray` system’s user database. 
It retrieves the output of the ypcat passwd command and filters the users who have the same first name 
(considered as the first word in the fifth field) as the user executing the script.

### Script 3: Setting Up tyden11 Directory

This script focuses on configuring the tyden11 directory on the server `fray1`.

#### Part 1
Creates a file named HD in *tyden11* with a single line containing your username.
Ensures specific file properties using ls.
#### Part 2
Generates a chain of symbolic links within the *tyden11* directory, 
where the length of the chain is defined by an input parameter. 
The first link points to /etc/hosts, and each subsequent link points to the previous one.
