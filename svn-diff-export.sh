#!/bin/bash

# Michael_Chi
# export changes for svn

svn_username= # svn username
svn_password= # svn password

color_reset='\033[0m'
color_red='\033[1;31m'
color_green='\033[1;32m'
color_yellow='\033[1;33m'
color_blue='\033[1;34m'

revision_from=${1} # start version
revision_to=${2} # end version
repository_url=${3} # repository url
destination_path=${4} # path to store the export files

# set user
set_user()
{
    printf "${color_yellow}> username: ${color_reset}"
    read svn_username
    printf "${color_yellow}> password: ${color_reset}"
    read -s svn_password
    printf "\n\n"
}

# show summarize
show_summarize()
{
    printf "${color_yellow}> Summarize${color_reset}\n"
    svn diff --username "${svn_username}" --password "${svn_password}" --no-auth-cache -r ${revision_from}:${revision_to} --summarize ${repository_url} | sort
}

# export changed files
export_change()
{
    printf "${color_yellow}> Start exporting changed files between revision ${color_red}${revision_from}${color_yellow} and ${color_red}${revision_to}${color_yellow}\n  to      ${color_blue}${destination_path}${color_reset}\n";
    changed_files=`svn diff --username "${svn_username}" --password "${svn_password}" --no-auth-cache -r ${revision_from}:${revision_to} --summarize ${repository_url} | sort | awk '/^(A|M| M)/{print $NF}'`
    for file in ${changed_files}
    do
        tmp_svn_full_file_name=${file}
        tmp_svn_full_file_name_encoded=`echo ${file} | sed -e 's/ /%20/g' -e 's/!/%21/g' -e 's/#/%23/g' -e 's/\\$/%24/g' -e 's/%/%25/g' -e 's/&/%26/g' -e "s/'/%27/g" -e 's/(/%28/g' -e 's/)/%29/g' -e 's/*/%2A/g' -e 's/+/%2B/g' -e 's/,/%2C/g' -e 's/;/%3B/g' -e 's/=/%3D/g' -e 's/?/%3F/g' -e 's/@/%40/g' -e 's/\[/%5B/g' -e 's/\]/%5D/g'` # svn url should encode. svn: URL 'svn://192.168.0.333/repos/mc/branches/project/www/download/img/test_3[1].jpg' is not properly URI-encoded
        #echo "${tmp_svn_full_file_name_encoded}"
        tmp_full_file_name=${file#*${repository_url}}
        [ -z "${tmp_full_file_name}" ] && continue # if no file name skip it
        tmp_file_path=`dirname ${tmp_full_file_name}`
        tmp_file_name=${tmp_full_file_name#*${tmp_file_path}}
        tmp_destination_full_file_name=${destination_path}${tmp_full_file_name}
        tmp_destination_path=`dirname ${tmp_destination_full_file_name}`
        #printf "svn_full_name: ${tmp_svn_full_file_name} full_file_name: ${tmp_full_file_name} file_path: ${tmp_file_path} file_name: ${tmp_file_name} tmp_destination_full_file_name: ${tmp_destination_full_file_name} destination_path: ${tmp_destination_path}\n"
        [ ! -d "${tmp_destination_path}" ] && mkdir -p ${tmp_destination_path}
        svn export --username "${svn_username}" --password "${svn_password}" --no-auth-cache --depth 'empty' --force -q -r ${revision_to} ${tmp_svn_full_file_name_encoded} ${tmp_destination_full_file_name} && printf "${color_green}[Success]${color_reset} ${tmp_destination_full_file_name}\n" || printf "${color_red}[Fail]${color_reset}    ${tmp_destination_full_file_name}\n"
    done
}

# print usage
print_usage()
{
    printf "usage:   ./svn-diff-export.sh [from rev] [to rev] [repository url] [destination]\nexample: /home/html/michael/svn-diff-export.sh r22117 r22321 svn://192.168.0.333/repos/mc/branches/project /home/html/michael/test_svn_export_333\n"
}

case ${1} in
    -h)
        print_usage
        exit 0
    ;;
esac

printf "${color_green}----------------------------------- start -----------------------------------${color_reset}\n";
set_user
show_summarize
export_change
printf "${color_green}-----------------------------------  end  -----------------------------------${color_reset}\n";
