# Project name
project_name="html-container"

# Find docker container (name and id) using wildcard pattern
# container_name=$(docker container ls -a | grep vsc-$project_name | awk "{print \$2}")
container_id=$(docker container ls -a | grep vsc-$project_name | awk "{print \$1}")

# Remove docker container via container_id
docker container rm -f $container_id

# Remove docker volume(s) by name
docker volume rm -f $project_name
docker volume rm -f vscode-extensions-$project_name
docker volume rm -f vscode-insiders-extensions-$project_name

# Find docker image (name and id) using wildcard pattern
# image_name=$(docker image ls | grep vsc-$project_name | awk "{print \$1}")
image_id=$(docker image ls | grep vsc-$project_name | awk "{print \$3}")

# Remove docker image via image_id
docker image rm -f $image_id