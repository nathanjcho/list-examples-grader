# Create your grading script here

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cp TestListExamples.java student-submission
cd student-submission

if ! { -f "ListExamples.java"}; then 
    echo "ListExamples.java is either missing or incorrect, please resubmit"
    echo "You received a 0 of 3"
    exit 
fi 

echo "File has been found"
 
javac -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar *.java 2> compile.txt

if [[ $? -ne 0 ]]
then
        echo "The code you submitted will not compile"
        echo "You received a 0 of 3"
        exit 
fi

java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > results.txt 

