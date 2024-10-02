#!/bin/bash
# for i in $(seq 5); do
    # for arch in "orig" "xlmr" "stanza"; do
    for arch in "xlmr"; do
        # for dist in "True" "False"; do
        for dist in "False"; do
            for ablation in "None"; do
            # for ablation in "argument marking (non-core)"; do
            # for ablation in "None" "argument marking (core)" "argument marking (non-core)" "class" "clause order" "deixis" "non-verbal prediction" "number" "quantification" "TAME" "valency" "verb complex" "VP (other)"; do
                for source in "syntax_knn" "syntax_grambank"; do
                    for task in "POS"; do
                    for dataset in "True"; do
                            # for i in $(seq 5); do
                            combo=$(printf '{"task": "%s", "ablation": "%s" , "distance": "%s", "source":"%s" , "arch":"%s", "dataset": "%s"}' "$task" "$ablation" "$dist" "$source" "$arch" "$dataset")
                            combos+=("$combo")
                            # done
                        done
                    done
                done
            done
        done
    done
# done
counter=200 # Initialize a counter
for c in "${combos[@]}"; do
   ((counter++))  
    filename="/projects/enri8153/langrank/configs/combo_${counter}.json"
    echo "$c" > "$filename"
    sbatch --export=COMBOS_FILE="${filename}" /projects/enri8153/langrank/scripts/run_one.sh
    # /projects/enri8153/langrank/scripts/run_one.sh "${filename}"
done

