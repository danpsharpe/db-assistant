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
- `mysqldump -P 3306 -h HOST -u USER -pPASSWORD --single-transaction --all-databases | gzip - > backup.sql.gz`