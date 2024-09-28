export RESTSERVER_DOMAIN=https://restserver.slave-1.tungwon.people.aws.dev
export MOCKSERVER_DOMAIN=https://bdd.slave-1.tungwon.people.aws.dev
export BEHAVE_TOOL_IMAGE_VERSION=public.ecr.aws/z0f1k7v6/behave-tool:v1.1.1
export TESTCASE=$1

# check the require input TESTCASE and show message if the input is not provided
if [ -z "$TESTCASE" ]; then
    echo "Usage example: $0 testcases/features/q1-header.feature"
    exit 1
fi

# docker image pull from BEHAVE_TOOL_IMAGE_VERSION if it is not exist
docker images | grep behave-tool > /dev/null
if [ $? -ne 0 ]; then
    docker pull $BEHAVE_TOOL_IMAGE_VERSION
    echo "Pulling $BEHAVE_TOOL_IMAGE_VERSION"
    sleep 5
    docker images | grep behave-tool
    if [ $? -ne 0 ]; then
        echo "Failed to pull $BEHAVE_TOOL_IMAGE_VERSION"
        exit 1
    fi
fi

docker run --rm -it -e APP2_URL=$RESTSERVER_DOMAIN -e APP1_URL=$MOCKSERVER_DOMAIN -v ./testcases:/home/bddtest/testcases --name behave-tool $BEHAVE_TOOL_IMAGE_VERSION bash -c "behave $TESTCASE && analyze_result"