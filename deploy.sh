#!/bin/bash
MODELNAME="$(sed -n "s/Package: *\([^ ]*\)/\1/p" DESCRIPTION)"
MODELVERS="$(sed -n "s/Version: *\([^ ]*\)/\1/p" DESCRIPTION)"
MODELSRC="$(basename `pwd`)"
AUTHORNAME="Steph"
AUTHOREMAIL="Steph@itsalocke.com"
GITURL="https://$GITHUB_PAT@github.com/$TRAVIS_REPO_SLUG.git"

git remote remove origin
git remote origin $GITURL
git config --global user.name $AUTHORNAME
git config --global user.email $AUTHOREMAIL

R CMD BATCH build.R
cp build.Rout docs
rm build.Rout

git add .
git commit -am "[ci skip] Documents produced in clean environment via Travis $TRAVIS_BUILD_NUMBER"
git push --quiet origin master
