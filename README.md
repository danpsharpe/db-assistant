# DB Assistant

This image was designed initially with the goal of providing the Percona Toolset to Windows users in a convenient docker container.

## Getting Started
- `docker-compose build`
- `docker-compose up -d`
- `docker container ls` *(Copy the Container ID)*
- `docker exec -it CONTAINER_ID bash`

## File Sharing
From CLI, run your commnds. You can pass files back and forth from the data directory:

- Host: `./data`
- Container: `/mnt/data`

### Backup / Restore database
- Backup: `mysqldump -u root -p[password] [database_name] > dump.sql`
- Restore: `mysql -u root -p[password] [database_name] < dump.sql`

## Tips
- The [host address](https://stackoverflow.com/questions/24319662/from-inside-of-a-docker-container-how-do-i-connect-to-the-localhost-of-the-mach#:~:text=To%20access%20MySQL%20running%20on,or%20bind%2Daddress%20%3D%200.0.) is `host.docker.internal` instead of `localhost`.
