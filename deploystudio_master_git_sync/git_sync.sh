#!/bin/bash

#########################################################
#                                                       #    
# Author:   Calum Hunter                                #
# Date:     03-03-15                                    #
# Purpose:  To make it easier when updating changes     #
#           to DeployStudio and pushing them to git     #
#                                                       #
#########################################################

# Variables and paths
ds_repo="/DS_Repo"


useage(){
    echo "

# Useage:
# ./gitsync repo_name
# Where repo_name is either workflows, files or scripts
# This will then sync those changes in those repos to git

"
}

git_status(){
    cd $1
    status=`git status -s`
    if [ -z "$status" ]; then
        echo "- NO UNTRACKED FILES OR MODIFIED FILES"
        echo "- Exiting"
        exit 0
    else
        echo "- Showing untracked files or modified files:"
        echo "$status"
    fi
}

add_changes(){
    cd $1
    echo "- Do you wish to add these untracked (y/n)"
    read add
    if [ $add = "y" ];
        then
        echo "- Adding files to next commit"
        git add -A
        echo "- What commit message would you like to add:"
        read commit_mesg
        git commit -m "${commit_mesg}"
        echo "- Changes committed!"
        echo "- Ready to push changes? (y/n)"
        read ready
        if [ $ready = "y" ];
            then 
                echo "- Pushing changes"
                git push -u origin --all
                echo "- All done!"
        elif [ $ready = "n" ]; then
            echo "- You said your not ready, bailing"
            exit 0
        fi
    elif [ $add = "n" ]; then
        echo "- You said you don't wish to add these modifications"
        exit 0
    fi
}

if [ -z $1 ]; then # Check to see if we are passed an argument, if not show useage and bail
    useage
    exit 0
fi

case $1 in
    workflows)
        echo "- You chose Workflows"
        git_status ${ds_repo}/Databases/Workflows
        add_changes ${ds_repo}/Databases/Workflows;;
    files)
        echo "- You chose Files"
        git_status ${ds_repo}/Files
        add_changes ${ds_repo}/Files;;
        
    scripts)
        echo "- You chose Scripts"
        git_status ${ds_repo}/Scripts
        add_changes ${ds_repo}/Scripts;;
    *)
        echo "Unrecognised name, I only support workflows, files and scripts"
        echo "Bailing out"
        exit 0;;
esac



exit 0


