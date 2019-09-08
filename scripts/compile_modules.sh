#!/bin/bash

# Clean build directory
rm -rf ./build
mkdir ./build
mkdir ./build/domain
mkdir ./build/actions
mkdir ./build/intents
mkdir ./build/stories
mkdir ./build/tests

# Append domains, actions, intents, stories and tests to the temporary build directory
MODULES="./modules/*"
for module in $MODULES
do
    if [ -f "$module/domain.yml" ]; then 
        cp "$module/domain.yml" "./build/domain/domain_$(basename $module).yml" 
    fi

    if [ -f "$module/actions.py" ]; then 
        cp "$module/actions.py" "./build/actions/actions_$(basename $module).py"
    fi

    if [ -f "$module/intents.md" ]; then 
        cp "$module/intents.md" "./build/intents/intents_$(basename $module).md"
    fi
    
    if [ -f "$module/stories.md" ]; then 
        cp "$module/stories.md" "./build/stories/stories_$(basename $module).md"
    fi
    
    if [ -f "$module/tests.py" ]; then 
        cp "$module/tests.py" "./build/tests/tests_$(basename $module).py"
    fi
done

# Concatenate domains into a single file (beware of duplicate values)
files=(build/domain/*)
docker run -v ${PWD}:/workdir --rm mikefarah/yq yq m -a ${files[@]//,/|} > build/domain/domain.yml
# docker rmi mikefarah/yq # Discard of the yq docker image; Comment this out for a faster build process
rm -rf build/domain/domain_*.yml