# Create your grading script here

rm -rf student-submission >line3.out 2> line3.err
echo $? > line3.exit
git clone $1 student-submission >line5.out 2> line5.err
echo $? > line5.exit
echo 'Finished cloning' >line7.out 2> line7.err
echo $? > line7.exit

cd student-submission/ 

if ! [ -f "ListExamples.java" ] 
then 
    echo 'ListExamples.java is either missing or incorrect, please resubmit' 
    echo 'You received a 0 of 3' 
    exit 
fi 

echo "File has been found" >line15.out 2> line15.err
echo $? > line15.exit
cd ..
cp TestListExamples.java student-submission/
cd student-submission/

javac -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar *.java 2> compile.txt

if [[ $? -ne 0 ]]
then
        echo "The code you submitted will not compile"
        echo "You received a 1 of 3"
        exit 
fi

java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples &> results.txt 

if [ $? -eq 0 ]
then
    echo "Tests passed!"
    echo "You received a 3 of 3"
    cat results.txt
    exit
else
    echo "Not all tests passed"
    echo "You received a 2 of 3"
    cat results.txt
fi