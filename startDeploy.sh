URI="https://api.heroku.com/apps/"
FORM="/formation"
URL=$URI$0$FORM

echo $URI
echo $FORM
echo $1
echo $2
echo $URL

echo `docker push registry.heroku.com/$1/web`

EXEC2=`curl -n -X PATCH "${URL}" -d "{'updates':[{'type': 'web', 'docker_image': '"${2}"'}]}" -H 'Content-Type: application/json' -H 'Accept: application/vnd.heroku+json; version=3.docker-releases'`

echo $EXEC

exit 0