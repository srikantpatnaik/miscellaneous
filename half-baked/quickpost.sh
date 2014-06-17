#!/bin/bash

# Change according to your need
BASEDIR="/home/srikant/Documents/gnu-linux.org"
INPUTDIR=$BASEDIR/content                                                     
OUTPUTDIR=$BASEDIR/output 
DRAFTDIR=$BASEDIR/content/draft

echo -e "\n"
echo "The default state of this post is DRAFT, remove the draft line to publish"
echo -e "\n"
read -p "Name of post: " post_name
read -p "Keywords (comma separated): " KEYWORDS
read -p "Category : " CATEGORY
read -p "Tags (comma separated): " TAGS
read -p "Description (A summary of post): " DESCRIPTION

count_char=$(echo $post_name | wc -c)
AUTHOR="Srikant Patnaik"
DATE=$(date +'%Y-%m-%d %H:%M')                                      
SLUG=$(echo $post_name | sed -e 's/[^[:alnum:]]/-/g' | tr -s '-' | tr A-Z a-z)

echo $post_name > $DRAFTDIR/$SLUG.rst
for each in $(seq 2 $count_char); do echo -n '#'; done >> $DRAFTDIR/$SLUG.rst
echo -e "\n\n" >> $DRAFTDIR/$SLUG.rst
echo ":date: $DATE" >> $DRAFTDIR/$SLUG.rst
echo ":author: Srikant Patnaik" >> $DRAFTDIR/$SLUG.rst
echo ":status: draft" >> $DRAFTDIR/$SLUG.rst
echo ":keywords: $KEYWORDS" >> $DRAFTDIR/$SLUG.rst
echo ":tags: $TAGS"  >> $DRAFTDIR/$SLUG.rst
echo ":category: $CATEGORY" >> $DRAFTDIR/$SLUG.rst
echo ":description: $DESCRIPTION" >> $DRAFTDIR/$SLUG.rst
echo ":slug: $SLUG" >> $DRAFTDIR/$SLUG.rst
echo -e "\n" >> $DRAFTDIR/$SLUG.rst


echo ".. rst help" >> $DRAFTDIR/$SLUG.rst
vim $DRAFTDIR/$SLUG.rst

