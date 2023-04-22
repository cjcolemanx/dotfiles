#!/usr/bin/env bash

# Set rating; if rating already matches, bump up half a star
# Rating values are double that of star value, so rating=6 is 3 stars
function rating {
	rating=$1
	# Rating passed in, set it
	if [ "${rating}" != "" ]; then
		rating=$(echo "(${rating} * 2) / 1" | bc)
		file=$(mpc ${mpcOptions} current -f '%file%')
		oldrating=$(mpc ${mpcOptions} sticker "${file}" get rating | cut -f 2 -d "=")
		if [ ${rating} == ${oldrating} ]; then
			rating=$((rating + 1))
		fi
		mpc ${mpcOptions} sticker "${file}" set rating $rating
		oldratingline=$(echo "scale=1;(${oldrating} / 2)" | bc)
		ratingline=$(echo "scale=1;(${rating} / 2)" | bc)
		# If we can come up with a half star, eh, maybe some day
		#ratingstars=`echo "(${rating} / 2)" | bc`
		line="Rating changed to ${ratingline} (was ${oldratingline})"
		#stars=$(printf '⭐%.0s' $(seq 1 ${ratingstars}))
		echo "${line}"
		notify-send "${line}" --icon=starred -t 3000
	else
		file=$(mpc ${mpcOptions} current -f '%file%')
		rating=$(mpc ${mpcOptions} sticker "${file}" get rating | cut -f 2 -d "=")
		ratingline=$(echo "scale=1;(${rating} / 2)" | bc)
		line="Current rating is ${ratingline}"
		echo ${line}
		notify-send "${line}" --icon=starred -t 3000
	fi
}
