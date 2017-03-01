#!/bin/bash
</path/to/your/packages/installation>/bin/console satis:build 2> /tmp/satis 
export exitCode=$?;

if [ $exitCode != 0 ];
then
    echo "$(cat /tmp/satis | grep -A 2 'InvalidRepositoryException')" > /tmp/satisException
    export exceptionSize="$(wc -c < '/tmp/satisException')";
    if [ $exceptionSize > 1 ];
    then
        mail -s "Something went wrong exposing your packages" <your-packages-admin>@<your-company>.com < /tmp/satisException
    fi
fi

rm /tmp/satis
rm /tmp/satisException
