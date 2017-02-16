#!/bin/bash
MODELNAME="$(sed -n "s/Package: *\([^ ]*\)/\1/p" DESCRIPTION)"
MODELVERS="$(sed -n "s/Version: *\([^ ]*\)/\1/p" DESCRIPTION)"
MODELSRC="$(basename `pwd`)"
AUTHORNAME="Steph"
AUTHOREMAIL="Steph@itsalocke.com"
RENDERDIR="../new_version"
GITURL="https://$GITHUB_PAT@github.com/$TRAVIS_REPO_SLUG.git"

git clone $GITURL $RENDERDIR
git config --global user.name $AUTHORNAME
git config --global user.email $AUTHOREMAIL
cd $RENDERDIR

R CMD BATCH build.R
cp build.Rout docs
rm build.Rout

git add .
git commit -am "[ci skip] Documents produced in clean environment via Travis $TRAVIS_BUILD_NUMBER"
git push --quiet origin master
