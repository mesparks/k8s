Role Name
=========
This role tags necessary resources on AWS that the instance uses (currently only volume)


Requirements
------------
No external requirements are needed


Role Variables
--------------
All variables are gathered using AWS ec2_vol_info and ec2_metadata_facts which are then parsed as needed in the tasks.

Variables initialized in the vars/main.yml file:
  - vol_ids - Used to store the volume IDs of the EC2 to be tagged


Dependencies
------------
Initialization


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------
BSD


Author Information
------------------
Created by: Dan Golden
On: 08/19/2021
