CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission
if[[ -f ListExamples.java]]
    then 
        echo 'ListExamples.java found'
    else 
        echo 'ListExamples.java needed'
        exit
fi
cp ../TestListExamples.java ./
cp -r ../lib ./
javac -cp $CPATH *.java
if[[ $? -ne 0]] 
    then    
        echo 'Compile Failed'
        exit
fi
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples
