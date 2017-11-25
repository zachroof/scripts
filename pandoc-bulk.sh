# Convert files via pandoc

TO_PREFIX=$1
FROM_PREFIX=$2
DIRECTORY=$3

for f in ${DIRECTORY}/*.${FROM_PREFIX}
do
    filename="${f%.*}"
    echo "Converting $f to ${filename}.${TO_PREFIX}"
    `pandoc -s $f -o ${filename}.${TO_PREFIX}`
    rm ${f}
done
