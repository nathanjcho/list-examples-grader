# Create your grading script here


rm -rf student-submission
git clone $1 student-submission
cd student-submission/
if [[ -f "ListExamples.java" ]] 
then
    echo "File was found."
else 
    echo "FAIL"
    echo "File was not found in directory" 
    exit
fi

cd ..
cp TestListExamples.java student-submission/

cd student-submission/
javac -cp .:/users/advaith/Documents/GitHub/list-examples-grader/lib/hamcrest-core-1.3.jar:/users/advaith/Documents/GitHub/list-examples-grader/lib/junit-4.13.2.jar *.java 2> error.txt
if [[ $? -eq 0 ]]
then
    echo "COMPILE SUCCESSFUL"
else
    echo "COMPILE ERROR"
    echo "$(cat error.txt)"
    exit
fi
java -cp .:/users/advaith/Documents/GitHub/list-examples-grader/lib/hamcrest-core-1.3.jar:/users/advaith/Documents/GitHub/list-examples-grader/lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > junit.txt
cat junit.txt




