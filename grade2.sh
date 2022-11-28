# Create your grading script here


rm -rf student-submission
git clone $1 student-submission

cp TestListExamples.java student-submission

cd student-submission

if [[ -e ./ListExamples.java ]]
then 
echo "file found"
fi

javac -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar *.java
java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > grade.txt 
#grep -w Failures grade.txt

if [[ $? -eq 0 ]]
then 
echo "You passed!"
else
OUTPUT="$(grep -w Failures grade.txt)"
echo "$OUTPUT"
#echo "You didn't pass"
#echo "$OUTPUT"
echo "Your total score is" "${OUTPUT:25:1}" "out of 3"
fi


