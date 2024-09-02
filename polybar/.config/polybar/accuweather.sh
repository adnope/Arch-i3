#!/bin/bash

API_KEY="4uv6YIUDxuwQpPnonANKSSAK27KkugKb"
LOCATION_KEY="353412"

function get_weather_conditions() {
    local api_key=$1
    local location_key=$2
    local base_url="http://dataservice.accuweather.com/currentconditions/v1/"
    local url="${base_url}${location_key}?apikey=${api_key}&details=true"

    # Make the API request using curl
    response=$(curl -s "$url")

    # Check if curl request was successful
    if [ $? -eq 0 ]; then
        # Extract data using jq
        temperature=$(echo "$response" | jq '.[0].Temperature.Metric.Value')
        real_feel=$(echo "$response" | jq '.[0].RealFeelTemperature.Metric.Value')
        phrase=$(echo "$response" | jq -r '.[0].RealFeelTemperature.Metric.Phrase')

        # Determine the icon based on the phrase
        icon=""
        if [ "$phrase" == "Hot" ]; then
            icon=%{F88c0d0}%{F#eceff4}
        elif [ "$phrase" == "Cold" ]; then
            icon=%{F88c0d0}%{F#eceff4}
        fi

        echo "$icon  $temperature°C"
    else
        echo "Failed to get weather data"
    fi
}

get_weather_conditions "$API_KEY" "$LOCATION_KEY"
