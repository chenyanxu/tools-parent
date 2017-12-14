cd kalix-parent && git pull origin master && mvn clean install
cd ..

cd framework-parent && git pull origin master && mvn -DskipTests=true clean install
cd ..

cd admin-parent && git pull origin master && mvn  -DskipTests=true clean install
cd ..

cd middleware-parent && git pull origin master && mvn  -DskipTests=true clean install
cd ..

cd oa-parent && git pull origin master && mvn clean install
cd ..

cd common-parent && git pull origin master && mvn clean install
cd ..

cd schedule-parent && git pull origin master && mvn clean install
cd ..

cd research-parent && git pull origin master && mvn clean install
cd ..

cd art-parent && git pull origin master && mvn clean install
cd ..

cd tools-parent && git pull origin master && mvn clean install
cd ..



