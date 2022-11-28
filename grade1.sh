FILE="ListExamples.java"
CPATH=".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"
rm -rf student-submission
echo "Cloning repository..."
git clone $1 student-submission
cd student-submission
if [[ -f "$FILE" ]]
then
        echo "$FILE has been found."
else
        echo "$FILE was not found."
        echo "Please resubmit your code with the correct file."
        exit 1
fi
cd ../
echo "Copying test file..."
cp TestListExamples.java student-submission/
cp -r lib student-submission/
cd student-submission/
javac -cp $CPATH *.java 2> error.txt
if [[ $? -ne 0 ]]
then
        echo "The code could not compile."
        cat error.txt
        exit 1
fi
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples | grep "Tests run:" > results.txt
NUMS=(`grep -o '[0-9]' results.txt`)
PASS=${NUMS[0]}

if [[ 2 -eq $PASS ]]
then
        echo "You have received a 0%"
fi

if [[ 1 -eq $PASS ]]
then
        echo "You have received a 50%"
fi

if [[ 0 -eq $PASS ]]
then
        echo "You have received a 100%"
fi
cat results.txt