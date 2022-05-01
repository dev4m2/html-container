# Project name
project_name="html-container"

# Find docker image (name and id) using wildcard pattern
image_name=$(docker image ls | grep vsc-$project_name | awk "{print \$1}")
# image_id=$(docker image ls | grep vsc-$project_name | awk "{print \$3}")

# Get truncated_image_name
prefix="vsc-"
truncated_image_name=$(echo $image_name | sed -e "s/^$prefix//")

# Build container from image and mounted volume(s)
docker run -it \
  -u vscode \
  -v $truncated_image_name:/workspaces \
  -v vscode:/vscode \
  -v vscode-extensions-$project_name:/home/vscode/.vscode-server/extensions \
  -v vscode-insiders-extensions-$project_name:/home/vscode/.vscode-server-insiders/extensions \
  $image_name