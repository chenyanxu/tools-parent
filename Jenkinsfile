// refer to https://github.com/siamaksade/cart-service/blob/jenkinsfiles/Jenkinsfile
node('maven') {
  stage('Build Tools App') {
    git url: "https://github.com/chenyanxu/admin-parent.git"
    sh "mvn install -DskipTests=true -s settings.xml"
  }
  stage('Deploy Tools App') {
    sh "mvn deploy -DskipTests=true -s settings.xml"
  }
}
