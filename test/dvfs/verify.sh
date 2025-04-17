mapping_success=$(grep -o '\[Mapping Success\]' trace.log | wc -l)
dvfs_enabled=$(grep -o 'tile average DVFS frequency level' trace.log | wc -l)
dvfs_no_effect=$(grep -o 'tile average DVFS frequency level: 100%' trace.log | wc -l)
if [ "$mapping_success" -eq 1 ] && [ "$dvfs_enabled" -eq 1 ] && [ "$dvfs_no_effect" -eq 0 ]; then
    grep -an '\[Mapping Success\]' trace.log
    echo "DVFS Test Pass!"
else
    echo "DVFS Test Fail!"
    echo "mapping_success: $mapping_success" 
    echo "dvfs_enabled: $dvfs_enabled"
    echo "dvfs_no_effect: $dvfs_no_effect"
    # exit 1
fi
