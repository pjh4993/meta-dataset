#!/bin/bash

if [ "$#" -lt 3 ]; then
	echo "Usage: $0 DATASRC SPLIT_ROOT RECORD_ROOT"
	exit 1
fi

DATASRC="$1"
SPLITS="$2"
RECORDS="$3"
HAVE_TO=("ilsvrc_2012" "omniglot" "aircraft" \
	"cu_birds" "dtd" "quickdraw" "fungi" "vgg_flower"\
	"traffic_sign" "mscoco")

if [ "$#" -gt 3 ]; then
	HAVE_TO=()
	for var in "${@:4}"
	do
		HAVE_TO+=("$var")
	done
fi

printf '%s\n' "${HAVE_TO[@]}"

value="ilsvrc_2012"
if [[ "${HAVE_TO[@]}" =~ "${value}" ]]; then
python -m meta_dataset.dataset_conversion.convert_datasets_to_records \
  --dataset=ilsvrc_2012 \
  --ilsvrc_2012_data_root=$DATASRC/ILSVRC2012_img_train \
  --splits_root=$SPLITS \
  --records_root=$RECORDS
fi

value="omniglot"
if [[ "${HAVE_TO[@]}" =~ "${value}" ]]; then
python -m meta_dataset.dataset_conversion.convert_datasets_to_records \
  --dataset=omniglot \
  --omniglot_data_root=$DATASRC/omniglot \
  --splits_root=$SPLITS \
  --records_root=$RECORDS
fi

value="aircraft"
if [[ "${HAVE_TO[@]}" =~ "${value}" ]]; then
python -m meta_dataset.dataset_conversion.convert_datasets_to_records \
  --dataset=aircraft \
  --aircraft_data_root=$DATASRC/fgvc-aircraft-2013b \
  --splits_root=$SPLITS \
  --records_root=$RECORDS
fi

value="cu_birds"
if [[ "${HAVE_TO[@]}" =~ "${value}" ]]; then
python -m meta_dataset.dataset_conversion.convert_datasets_to_records \
  --dataset=cu_birds \
  --cu_birds_data_root=$DATASRC/CUB_200_2011 \
  --splits_root=$SPLITS \
  --records_root=$RECORDS
fi

value="dtd"
if [[ "${HAVE_TO[@]}" =~ "${value}" ]]; then
python -m meta_dataset.dataset_conversion.convert_datasets_to_records \
  --dataset=dtd \
  --dtd_data_root=$DATASRC/dtd \
  --splits_root=$SPLITS \
  --records_root=$RECORDS
fi

value="quickdraw"
if [[ "${HAVE_TO[@]}" =~ "${value}" ]]; then
python -m meta_dataset.dataset_conversion.convert_datasets_to_records \
  --dataset=quickdraw \
  --quickdraw_data_root=$DATASRC/quickdraw \
  --splits_root=$SPLITS \
  --records_root=$RECORDS
fi

value="fungi"
if [[ "${HAVE_TO[@]}" =~ "${value}" ]]; then
python -m meta_dataset.dataset_conversion.convert_datasets_to_records \
  --dataset=fungi \
  --fungi_data_root=$DATASRC/fungi \
  --splits_root=$SPLITS \
  --records_root=$RECORDS
fi

value="vgg_flower"
if [[ "${HAVE_TO[@]}" =~ "${value}" ]]; then
python -m meta_dataset.dataset_conversion.convert_datasets_to_records \
  --dataset=vgg_flower \
  --vgg_flower_data_root=$DATASRC/vgg_flower \
  --splits_root=$SPLITS \
  --records_root=$RECORDS
fi

value="traffic_sign"
if [[ "${HAVE_TO[@]}" =~ "${value}" ]]; then
python -m meta_dataset.dataset_conversion.convert_datasets_to_records \
  --dataset=traffic_sign \
  --traffic_sign_data_root=$DATASRC/GTSRB \
  --splits_root=$SPLITS \
  --records_root=$RECORDS
fi

value="mscoco"
if [[ "${HAVE_TO[@]}" =~ "${value}" ]]; then
python -m meta_dataset.dataset_conversion.convert_datasets_to_records \
  --dataset=mscoco \
  --mscoco_data_root=$DATASRC/mscoco \
  --splits_root=$SPLITS \
  --records_root=$RECORDS
fi
