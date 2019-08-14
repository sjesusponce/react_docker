URI="https://api.heroku.com/apps/"
FORM="/formation"
URL=$URI$1$FORM

EXEC1=`docker push registry.heroku.com/$1/web`

echo $EXEC1

EXEC2=`curl -n -X PATCH "${URL}" -d "{'updates':[{'type': 'web', 'docker_image': "${2}"}]}" -H "Content-Type: application/json" -H "Accept: application/vnd.heroku+json; version=3.docker-releases" -H "Authorization: Bearer "${3}""`

echo $EXEC2

exit 0