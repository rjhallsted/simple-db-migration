# simple-db-migration
I got tired of doing database migrations manually.

# Setup
On the remote server, in whichever directory is defaulted to when you ssh into it as root, named `.db-migrate-config` and give it the following content:
```
DB_NAME="db"
DB_USER="root"
DB_PASS="password"
```

On your local machine, in the root of your project, (or wherever you will run the script from), do the same thing.
