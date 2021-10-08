#!/bin/bash

DIRNAME="$(dirname $0)"

$DIRNAME/gen_mask_dataset.py $DIRNAME/../configs/gen_dataset1.yaml \
    /data/inpainting/Places365/debug \
    /data/inpainting/Places365/debug_masks1 \
    --n-jobs 6

$DIRNAME/calc_dataset_stats.py /data/inpainting/Places365/debug_masks1 \
    /data/inpainting/Places365/debug_masks1_summary \
    --samples-n 20

$DIRNAME/predict_hifill_baseline.py /data/inpainting/Places365/debug_masks1 \
    /data/inpainting/Places365/debug_masks1_hifill

$DIRNAME/evaluate_predicts.py $DIRNAME/../configs/eval1.yaml \
    /data/inpainting/Places365/debug_masks1 \
    /data/inpainting/Places365/debug_masks1_hifill \
    /data/inpainting/Places365/metrics/debug_masks1_hifill.csv