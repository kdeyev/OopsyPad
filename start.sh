#!/bin/sh
set -e

# sh oopsy_celery_worker.sh run
sh oopsy_run_server.sh --host 0.0.0.0 --port 8000
# sh oopsy_celery_worker.sh stop