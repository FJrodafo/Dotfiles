#!/bin/bash
set -euo pipefail

# Script inspired by https://www.lipsum.com/

WORDS=(
    lorem ipsum dolor sit amet consectetur adipiscing elit etiam a auctor est
    nullam at ligula fermentum gravida erat ac tristique felis nam vestibulum
    quam aliquet tempor nisi iusto scelerisque efficitur eros id suspendisse
    eget odio congue condimentum diam imperdiet vehicula praesent facilisis
    tempus pharetra maecenas in purus lectus faucibus sodales quis feugiat nisl
    augue fusce semper arcu massa accumsan donec sed magna pellentesque vel
    aenean finibus vivamus non dui vitae orci dictum et ante primis luctus velit
    ultrices posuere cubilia curae nulla urna mattis lacus mauris pulvinar
    metus ut interdum facilisi ullamcorper tincidunt justo proin risus tempor
    dapibus neque aliquam rhoncus sagittis convallis commodo leo sodales duis
    est feugiat eu libero suscipit nisl sollicitudin vulputate nibh viverra
    quisque bibendum nunc consequat sem venenatis rutrum porttitor habitant
    morbi senectus netus malesuada fames turpis egestas lacinia mi massa habitasse
    elementum hendrerit porta scelerisque class aptent taciti sociosqu ad hac
    litora torquent per conubia nostra inceptos himenaeos pretium molestie
    turpis dignissim phasellus ornare iaculis malesuada tellus sollicitudin
    blandit eleifend varius dictumst fringilla laoreet potenti maximus integer
    placerat consequat ex sapien euismod volutpat nunc ultricies mollis molestie
)

# Sentence/paragraph configuration.
MIN_WORDS_PER_SENTENCE=6
MAX_WORDS_PER_SENTENCE=12
MIN_SENTENCES=6
MAX_SENTENCES=12

# Returns a random number between $1 and $2
rand_between() {
    local lo=$1 hi=$2
    echo $(( RANDOM % (hi - lo + 1) + lo ))
}

# Returns a random word.
pick_word() {
    local idx=$(( RANDOM % ${#WORDS[@]} ))
    echo "${WORDS[$idx]}"
}

# Generates one sentence.
make_sentence() {
    local nwords
    nwords=$(rand_between "$MIN_WORDS_PER_SENTENCE" "$MAX_WORDS_PER_SENTENCE")

    local sentence=""
    for ((i=0; i<nwords; i++)); do
        local w
        w="$(pick_word)"
        sentence+="$w"

        if (( i < nwords - 1 )); then
            # randomly insert commas.
            if (( RANDOM % 6 == 0 && i > 1 )); then
                sentence+=", "
            else
                sentence+=" "
            fi
        fi
    done

    sentence+="."
    echo -n "$sentence"
}

# Generates a complete paragraph, always starting with the fixed first sentence.
make_paragraph() {
    local nsent
    nsent=$(rand_between "$MIN_SENTENCES" "$MAX_SENTENCES")

    # Fixed first sentence.
    local para="Lorem ipsum dolor sit amet, consectetur adipiscing elit."

    # Add generated sentences.
    for ((s=1; s<nsent; s++)); do
        para+=" $(make_sentence)"
    done

    # Capitalize first letter after a period and space.
    para=$(echo "$para" | sed -E 's/(\. )([a-z])/\1\u\2/g')

    echo "$para"
}

# Run immediately.
make_paragraph
