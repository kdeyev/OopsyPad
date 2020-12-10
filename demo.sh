#!/bin/bash

sh oopsy_admin.sh login -u admin@admin.admin -p 123456
sh oopsy_admin.sh project add rdm -v 0.9 -p Linux -p MacOS -p Windows
sh oopsy_symfile.sh send demo/demo.sym 0.9
sh oopsy_crash_report.sh demo/demo.dmp rdm 0.9 Linux