# THIS WILL WRITE INTO $HOME/jsw-output

INFLAME=$PWD/inflame.sh
JAR=$PWD/target/java-spark-workshop-0.0.1-SNAPSHOT.jar # this jar must be accessible from the cluster
CLASS=org.janelia.workshop.spark.InjectionRendering
N_NODES=5

INPUT_FILE=/tier2/saalfeld/hanslovskyp/java-spark-workshop/example-files.txt
TRANSFORM=/tier2/saalfeld/hanslovskyp/java-spark-workshop/transform.csv
N_SCANS_PER_SECTION=12
MIN=0
MAX=1000
OUTPUT_DIR=$HOME/jsw-output/rendering
OUTPUT_FORMAT=$OUTPUT_DIR/%05d.tif
K=6
ARGV="-f $INPUT_FILE -F -o $OUTPUT_FORMAT -m $MIN -M $MAX -c $TRANSFORM -k $K -n $N_SCANS_PER_SECTION"

mkdir -p $OUTPUT_DIR

$INFLAME $N_NODES $JAR $CLASS $ARGV
