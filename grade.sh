# Create your grading script here

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd ${1:35}

if ! { -f "ListExamples.java"}; then 
    echo "ListExamples.java is either missing or incorrect, please resubmit"
    cd .. ${1:35}
    rm -rf ${1:35}
    exit
fi 

echo "file found"
cd ..
cp TestListExamples.java student-submission
cd student-submission
 
javac -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar *.java
java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > grade.txt 

